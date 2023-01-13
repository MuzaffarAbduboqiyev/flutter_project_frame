import 'package:flutter_core/util/const/mask_formatters.dart';

extension MaskExtensions on String {
  String innMask() => innMaskFormatter.maskText(this);

  String innUnmask() => innMaskFormatter.unmaskText(this);

  String vatMask() => vatMaskFormatter.maskText(this);

  String vatUnmask() => vatMaskFormatter.unmaskText(this);

  String dateMask() => dateMaskFormatter.maskText(this);

  String dateUnmask() => dateMaskFormatter.unmaskText(this);

  String paymentAccountMask() => paymentAccountMaskFormatter.maskText(this);

  String paymentAccountUnmask() => paymentAccountMaskFormatter.unmaskText(this);
}
