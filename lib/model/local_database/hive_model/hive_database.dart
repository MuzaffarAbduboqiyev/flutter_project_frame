import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as paths;

class HiveDatabase {
  final Box box;

  HiveDatabase({
    required this.box,
  });

  static Future<Box> setup() async {
    final dataDir = await paths.getApplicationDocumentsDirectory();
    await Hive.initFlutter(dataDir.path);
    return await Hive.openBox(hiveDatabaseName);
  }

  Future<bool> changeThemeMode(bool state) async {
    await box.put(hiveCurrentTheme, state);
    return state;
  }

  Future<bool> getThemeMode() async {
    final bool state = await box.get(hiveCurrentTheme, defaultValue: true);
    return state;
  }

  Future<String> getToken() async {
    final String token = await box.get(hiveToken, defaultValue: "");
    return token;
  }

  Future<bool> setToken(String token) async {
    await box.put(hiveToken, token);
    return true;
  }

  Future<String> getPhone() async {
    final String userPhone = await box.get(hivePhone, defaultValue: "");
    return userPhone;
  }

  Future<bool> setPhone(String phone) async {
    await box.put(hivePhone, phone);
    return true;
  }

  Future<String> getName() async {
    final userName = await box.get(hiveName, defaultValue: "");
    return userName;
  }

  Future<bool> setName(String name) async {
    await box.put(hiveName, name);
    return true;
  }
}

const hiveDatabaseName = "delivery_service_hive_database";
const hiveCurrentTheme = "delivery_service_hive_theme";
const hiveToken = "delivery_service_hive_token";
const hivePhone = "delivery_service_hive_phone";
const hiveName = "delivery_service_hive_name";
