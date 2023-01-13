import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/util/service/helper_service/logs.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    showLogWithTag("onCreate", bloc);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    showLogWithTag("onTransition", transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    showLogWithTag("onError", error);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    showLogWithTag("onEvent", event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    showLogWithTag("onChange", change);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    showLogWithTag("onClose", bloc);
  }
}
