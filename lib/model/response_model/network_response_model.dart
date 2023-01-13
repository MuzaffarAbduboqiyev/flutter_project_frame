import 'package:dio/dio.dart';

enum ResponseErrorType {
  networkError,
  connectionError,
  serverError,
  authError,
  dataError,
  parseError,
  canceledError,
  noError,
}

/// Network Response
class NetworkResponseModel {
  final bool status;
  final Response? response;
  final ResponseErrorType errorType;
  final String errorMessage;

  NetworkResponseModel({
    required this.status,
    required this.response,
    required this.errorType,
    required this.errorMessage,
  });

  factory NetworkResponseModel.success({
    required Response? response,
  }) =>
      NetworkResponseModel(
        status: true,
        response: response,
        errorType: ResponseErrorType.noError,
        errorMessage: "",
      );

  factory NetworkResponseModel.error({
    required ResponseErrorType errorType,
    required String errorMessage,
  }) =>
      NetworkResponseModel(
        status: false,
        errorType: errorType,
        response: null,
        errorMessage: errorMessage,
      );
}

/// Status Response model
class SimpleResponseModel {
  final bool status;
  final ResponseErrorType errorType;
  final String responseMessage;

  SimpleResponseModel({
    required this.status,
    required this.errorType,
    required this.responseMessage,
  });

  factory SimpleResponseModel.success({
    String? responseMessage,
  }) =>
      SimpleResponseModel(
        status: true,
        errorType: ResponseErrorType.noError,
        responseMessage: responseMessage ?? "",
      );

  factory SimpleResponseModel.error({
    required ResponseErrorType errorType,
    required String? responseMessage,
  }) =>
      SimpleResponseModel(
        status: false,
        errorType: errorType,
        responseMessage: responseMessage ?? "",
      );
}

/// Data Response model
class DataResponseModel<T> {
  final bool status;
  final T? data;
  final ResponseErrorType errorType;
  final String errorMessage;

  DataResponseModel({
    required this.status,
    required this.data,
    required this.errorType,
    required this.errorMessage,
  });

  factory DataResponseModel.success({
    required T? model,
    String? responseMessage,
  }) =>
      DataResponseModel(
        status: true,
        data: model,
        errorType: ResponseErrorType.noError,
        errorMessage: responseMessage ?? "",
      );

  factory DataResponseModel.error({
    required ResponseErrorType errorType,
    required String? responseMessage,
  }) =>
      DataResponseModel(
        status: false,
        data: null,
        errorType: errorType,
        errorMessage: responseMessage ?? "",
      );
}
