import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_core/model/local_database/hive_model/hive_repository.dart';
import 'package:flutter_core/model/response_model/network_response_model.dart';
import 'package:flutter_core/util/service/helper_service/logs.dart';
import 'package:flutter_core/util/service/helper_service/translator.dart';
import 'package:flutter_core/util/service/network_service/urls.dart';

abstract class NetworkService {
  Future<NetworkResponseModel> postMethod({
    required String url,
    required dynamic body,
    bool hasHeader = true,
  });

  Future<NetworkResponseModel> getMethod({
    required String url,
    bool hasHeader = true,
  });

  Future<bool> hasInternet();

  Future<Map<String, String>> header({
    required bool hasHeader,
  });
}

class NetworkServiceImpl extends NetworkService {
  final HiveRepository hiveRepository;
  final Dio dio;

  NetworkServiceImpl({
    required this.hiveRepository,
    required this.dio,
  });

  @override
  Future<NetworkResponseModel> getMethod({
    required String url,
    bool hasHeader = true,
  }) async {
    if (await hasInternet()) {
      try {
        dio.options.headers = await header(hasHeader: hasHeader);
        showLogWithTag("Url: $url", "Request options: ${dio.options.headers}");
        final response = await dio.get(url);
        showLogWithTag("Url: $url", "Response: $response");
        return NetworkResponseModel.success(response: response);
      } on DioError catch (error) {
        if (error.type == DioErrorType.connectTimeout || error.type == DioErrorType.sendTimeout || error.type == DioErrorType.receiveTimeout) {
          return NetworkResponseModel.error(
            errorType: ResponseErrorType.connectionError,
            errorMessage: translate("error.network.connection_timeout"),
          );
        } else if (error.type == DioErrorType.response) {
          return NetworkResponseModel.error(
            errorType: ResponseErrorType.serverError,
            errorMessage: translate("error.network.server_error"),
          );
        } else if (error.type == DioErrorType.cancel) {
          return NetworkResponseModel.error(
            errorType: ResponseErrorType.canceledError,
            errorMessage: translate("error.network.canceled"),
          );
        } else {
          return NetworkResponseModel.error(
            errorType: ResponseErrorType.connectionError,
            errorMessage: error.message,
          );
        }
      }
    } else {
      return NetworkResponseModel.error(
        errorType: ResponseErrorType.networkError,
        errorMessage: translate("error.network.no_internet"),
      );
    }
  }

  @override
  Future<NetworkResponseModel> postMethod({
    required String url,
    required dynamic body,
    bool hasHeader = true,
  }) async {
    if (await hasInternet()) {
      try {
        dio.options.headers = await header(hasHeader: hasHeader);
        showLogWithTag("Request url: $url", "Request body: $body");
        final response = await dio.post(
          url,
          data: body,
        );
        showLogWithTag("Response url: $url", "Response body: $response");
        return NetworkResponseModel.success(response: response);
      } on DioError catch (error) {
        if (error.type == DioErrorType.connectTimeout) {
          showLogWithTag("Response url: $url", "Error: ${translate("error.network.connection_timeout")}");
          return NetworkResponseModel.error(
            errorType: ResponseErrorType.connectionError,
            errorMessage: translate("error.network.connection_timeout"),
          );
        } else if (error.type == DioErrorType.response) {
          showLogWithTag("Response url: $url", "Error: ${translate("error.network.server_error")}");
          return NetworkResponseModel.error(
            errorType: ResponseErrorType.serverError,
            errorMessage: translate("error.network.server_error"),
          );
        } else if (error.type == DioErrorType.cancel) {
          showLogWithTag("Response url: $url", "Error: ${translate("error.network.canceled")}");
          return NetworkResponseModel.error(
            errorType: ResponseErrorType.canceledError,
            errorMessage: translate("error.network.canceled"),
          );
        } else {
          showLogWithTag("Response url: $url", "Error: ${error.message}");
          return NetworkResponseModel.error(
            errorType: ResponseErrorType.connectionError,
            errorMessage: error.message,
          );
        }
      }
    } else {
      return NetworkResponseModel.error(
        errorType: ResponseErrorType.networkError,
        errorMessage: translate("error.network.no_internet"),
      );
    }
  }

  @override
  Future<Map<String, String>> header({required bool hasHeader}) async {
    final Map<String, String> headers = {};
    headers["Accept"] = "application/json";
    headers["Content-Type"] = "application/json";

    final String token = await hiveRepository.getToken();

    if (token.isNotEmpty) {
      headers["Authorization"] = "Bearer $token";
    }

    return headers;
  }

  @override
  Future<bool> hasInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none ||
        connectivityResult == ConnectivityResult.bluetooth) {
      return false;
    } else {
      return true;
    }
  }
}

final dioBaseOption = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 30000,
  receiveTimeout: 30000,
);
