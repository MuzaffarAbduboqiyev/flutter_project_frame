import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_core/model/local_database/hive_model/hive_repository.dart';
import 'package:flutter_core/model/response_model/network_response_model.dart';
import 'package:flutter_core/util/permissions/request_simple_permission.dart';
import 'package:flutter_core/util/service/helper_service/translator.dart';
import 'package:flutter_core/util/service/singleton/singleton.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<SimpleResponseModel> downloadPdf({
  required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  String downloadUrl = "PUBLIC_OFFERTA",
  String downloadMethod = "get",
}) async {
  final dir = await getApplicationDocumentsDirectory();
  final storagePermissionStatus = await requestPermission(
    permissionType: Permission.storage,
  );

  if (storagePermissionStatus) {
    final savePath = path.join(dir.path, "APP.pdf");
    final response = await _startDownload(
      downloadUrl,
      downloadMethod,
      savePath,
      flutterLocalNotificationsPlugin,
    );
    return response;
  } else {
    return SimpleResponseModel.error(
      errorType: ResponseErrorType.dataError,
      responseMessage: translate("error.permission_error.storage_error"),
    );
  }
}

Future<SimpleResponseModel> _startDownload(
  String downloadUrl,
  String downloadMethod,
  String savePath,
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
) async {
  final token = await getIt<HiveRepository>().getToken();
  final Dio dio = Dio();

  if (token.isNotEmpty) {
    dio.options.headers['authorization'] = "Bearer $token";
  }

  Map<String, dynamic> result = {
    'isSuccess': false,
    'filePath': null,
    'error': null,
  };

  try {
    final response = await dio.download(
      downloadUrl,
      savePath,
      options: Options(
          method: downloadMethod,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );

    result['isSuccess'] = response.statusCode == 200;
    result['filePath'] = savePath;
    final notificationResponse =
        await showNotification(result, flutterLocalNotificationsPlugin);
    return notificationResponse;
  } catch (ex) {
    result['error'] = ex.toString();
    return SimpleResponseModel.error(
      errorType: ResponseErrorType.parseError,
      responseMessage: translate("error.download_error.not_downloaded"),
    );
  }
}

Future<SimpleResponseModel> showNotification(
  Map<String, dynamic> downloadStatus,
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
) async {
  const android = AndroidNotificationDetails('channel id', 'channel name',
      channelDescription: 'channel description',
      priority: Priority.high,
      importance: Importance.max);

  const iOS = IOSNotificationDetails();
  const platform = NotificationDetails(android: android, iOS: iOS);
  final json = jsonEncode(downloadStatus);
  final isSuccess = downloadStatus['isSuccess'];

  if (isSuccess) {
    await flutterLocalNotificationsPlugin.show(
      0, // notification id
      translate("success.success"),
      translate("success.download_success.downloaded"),
      platform,
      payload: json,
    );
    return SimpleResponseModel.success(
      responseMessage: translate("success.download_success.downloaded"),
    );
  } else {
    return SimpleResponseModel.error(
      errorType: ResponseErrorType.authError,
      responseMessage: translate("error.permission_error.download_error"),
    );
  }
}
