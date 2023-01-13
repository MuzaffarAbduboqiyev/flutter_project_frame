import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_filex/open_filex.dart';

class Notification {
  static Future<FlutterLocalNotificationsPlugin> notificationPlugin() async{
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const macos = MacOSInitializationSettings();
    const linux = LinuxInitializationSettings(
      defaultActionName: "Open notification",
    );
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = IOSInitializationSettings();
    const initSettings = InitializationSettings(
      android: android,
      iOS: iOS,
      macOS: macos,
      linux: linux,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onSelectNotification: (String? json) async {
        final obj = jsonDecode(json ?? "");
        if (obj['isSuccess']) {
          await OpenFilex.open(obj['filePath']);
        }
      },
    );
    return flutterLocalNotificationsPlugin;
  }
}
