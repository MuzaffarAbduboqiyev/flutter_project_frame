import 'package:flutter_core/util/const/mask_formatters.dart';

extension PhoneExtensions on String {
  String phoneMask() {
    if (length == 13) {
      return phoneMaskFormatter.maskText(substring(4, length));
    } else if (length == 12) {
      return phoneMaskFormatter.maskText(substring(3, length));
    } else if (length == 9) {
      return phoneMaskFormatter.maskText(this);
    } else {
      return this;
    }
  }

  String phoneFullMask() {
    if (length == 13) {
      return "+998 ${phoneMaskFormatter.maskText(substring(4, length))}";
    } else if (length == 12) {
      return "+998 ${phoneMaskFormatter.maskText(substring(3, length))}";
    } else if (length == 9) {
      return "+998 ${phoneMaskFormatter.maskText(this)}";
    } else {
      return this;
    }
  }

  String phoneUnmask() {
    if (length == 17) {
      return phoneMaskFormatter
          .unmaskText(substring(5, length));
    } else if (length == 16) {
      return phoneMaskFormatter
          .unmaskText(substring(4, length));
    }else {
      return phoneMaskFormatter.unmaskText(this);
    }
  }

  String phoneFullUnmask() {
    if (length == 17) {
      return "998${phoneMaskFormatter.unmaskText(substring(5, length))}";
    } else if (length == 16) {
      return "998${phoneMaskFormatter.unmaskText(substring(4, length))}";
    } else if (length == 12) {
      return "998${phoneMaskFormatter.unmaskText(this)}";
    } else {
      return this;
    }
  }
}
