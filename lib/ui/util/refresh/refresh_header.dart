import 'package:flutter_core/util/service/helper_service/translator.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

refreshHeader() {
  return ClassicHeader(
    refreshingText: translate("refresh.refreshing"),
    completeText: translate("refresh.completed"),
    failedText: translate("refresh.failed"),
    releaseText: translate("refresh.release"),
    idleText: translate("refresh.idle"),
  );
}