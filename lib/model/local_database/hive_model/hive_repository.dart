
import 'package:flutter_core/model/local_database/hive_model/hive_database.dart';

abstract class HiveRepository {
  Future<bool> changeThemeMode();

  Future<bool> getThemeMode();

  Future<String> getToken();

  Future<bool> setToken(String token);

  Future<String> getPhone();

  Future<bool> setPhone(String phone);

  Future<String> getName();

  Future<bool> setName(String name);

  Future<bool> hasUser();
}

class HiveRepositoryImpl extends HiveRepository {
  final HiveDatabase hiveDatabase;

  HiveRepositoryImpl({
    required this.hiveDatabase,
  });

  @override
  Future<bool> changeThemeMode() async {
    final bool state = await getThemeMode();
    final response = await hiveDatabase.changeThemeMode(!state);
    return response;
  }

  @override
  Future<String> getName() async {
    final response = await hiveDatabase.getName();
    return response;
  }

  @override
  Future<String> getPhone() async {
    final response = await hiveDatabase.getPhone();
    return response;
  }

  @override
  Future<bool> getThemeMode() async {
    final response = await hiveDatabase.getThemeMode();
    return response;
  }

  @override
  Future<String> getToken() async {
    final response = await hiveDatabase.getToken();
    return response;
  }

  @override
  Future<bool> hasUser() async {
    final response = await getToken();
    return response.isNotEmpty;
  }

  @override
  Future<bool> setName(String name) async {
    final response = await hiveDatabase.setName(name);
    return response;
  }

  @override
  Future<bool> setPhone(String phone) async {
    final response = await hiveDatabase.setPhone(phone);
    return response;
  }

  @override
  Future<bool> setToken(String token) async {
    final response = await hiveDatabase.setToken(token);
    return response;
  }
}
