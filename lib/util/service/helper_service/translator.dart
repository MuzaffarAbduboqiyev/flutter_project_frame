import 'package:easy_localization/easy_localization.dart';

String translate(String? word) {
  if (word != null) {
    return word.tr();
  } else {
    return "";
  }
}