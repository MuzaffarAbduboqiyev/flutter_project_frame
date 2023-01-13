import 'package:flutter/foundation.dart';

showLog(Object? log) {
  if (kDebugMode) {
    print(log);
  }
}

showLogWithTag(String tag, Object? log) {
  if (kDebugMode) {
    print("$tag: $log");
  }
}
