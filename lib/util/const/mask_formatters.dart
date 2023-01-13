import 'package:easy_localization/easy_localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final MaskTextInputFormatter phoneMaskFormatter = MaskTextInputFormatter(
  mask: "(##) ### ## ##",
  filter: {"#": RegExp(r'[0-9]')},
);

final MaskTextInputFormatter innMaskFormatter = MaskTextInputFormatter(
  mask: "### ### ###",
  filter: {"#": RegExp(r'[0-9]')},
);

final MaskTextInputFormatter vatMaskFormatter = MaskTextInputFormatter(
  mask: "### ### ### ###",
  filter: {"#": RegExp(r'[0-9]')},
);

final MaskTextInputFormatter dateMaskFormatter = MaskTextInputFormatter(
  mask: "##.##.####",
  filter: {"#": RegExp(r'[0-9]')},
);

final MaskTextInputFormatter paymentAccountMaskFormatter =
    MaskTextInputFormatter(
  mask: "#### #### #### #### ####",
  filter: {"#": RegExp(r'[0-9]')},
);

final moneyMaskFormatter = NumberFormat("#,##0", "uz_UZ");
