import 'package:dio/dio.dart';
import 'package:flutter_core/model/local_database/hive_model/hive_database.dart';
import 'package:flutter_core/model/local_database/hive_model/hive_repository.dart';
import 'package:flutter_core/model/local_database/moor_database/moor_database.dart';
import 'package:flutter_core/ui/util/notification/notification.dart';
import 'package:flutter_core/util/service/network_service/network_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingletonAsync<Box>(
    () async => HiveDatabase.setup(),
  );

  getIt.registerSingletonAsync<FlutterLocalNotificationsPlugin>(
    () async => Notification.notificationPlugin(),
  );

  getIt.registerSingletonWithDependencies<HiveDatabase>(
    () => HiveDatabase(
      box: getIt<Box>(),
    ),
    dependsOn: [Box],
  );

  getIt.registerLazySingleton<Dio>(
    () => Dio(dioBaseOption),
  );

  getIt.registerSingletonWithDependencies<HiveRepository>(
    () => HiveRepositoryImpl(
      hiveDatabase: getIt<HiveDatabase>(),
    ),
    dependsOn: [HiveDatabase],
  );

  getIt.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(
      hiveRepository: getIt<HiveRepository>(),
      dio: getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton<MoorDatabase>(
        () => MoorDatabase(),
  );
}
