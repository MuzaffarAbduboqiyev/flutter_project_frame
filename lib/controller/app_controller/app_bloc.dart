import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_core/controller/app_controller/app_event.dart';
import 'package:flutter_core/controller/app_controller/app_state.dart';
import 'package:flutter_core/model/local_database/hive_model/hive_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final HiveRepository hiveRepository;

  AppBloc({required this.hiveRepository}) : super(AppState.initial()) {
    on<AppInitEvent>(
      _init,
      transformer: sequential(),
    );

    on<AppChangeThemeEvent>(
      _changeTheme,
      transformer: sequential(),
    );

    on<AppGetThemeEvent>(
      _getTheme,
      transformer: sequential(),
    );
  }

  FutureOr<void> _init(AppInitEvent event, Emitter<AppState> emit) async {
    final isDarkMode = await hiveRepository.getThemeMode();
    final hasToken = await hiveRepository.hasUser();

    emit(
      state.copyWith(
        isDarkMode: isDarkMode,
        hasToken: hasToken,
      ),
    );
  }

  FutureOr<void> _changeTheme(
    AppChangeThemeEvent event,
    Emitter<AppState> emit,
  ) async {
    final response = await hiveRepository.changeThemeMode();

    emit(
      state.copyWith(
        isDarkMode: response,
      ),
    );
  }

  FutureOr<void> _getTheme(
    AppGetThemeEvent event,
    Emitter<AppState> emit,
  ) async {
    final response = await hiveRepository.getThemeMode();

    emit(
      state.copyWith(
        isDarkMode: response,
      ),
    );
  }
}
