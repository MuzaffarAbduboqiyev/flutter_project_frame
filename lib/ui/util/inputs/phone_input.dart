import 'package:flutter/material.dart';
import 'package:flutter_core/util/const/mask_formatters.dart';
import 'package:flutter_core/util/extensions/input_decoration_extensions.dart';
import 'package:flutter_core/util/extensions/phone_extensions.dart';
import 'package:flutter_core/util/extensions/text_style_extensions.dart';
import 'package:flutter_core/util/service/helper_service/translator.dart';

class PhoneInput extends StatelessWidget {
  final TextEditingController phoneController;
  final TextInputAction textInputAction;
  final bool readOnly;
  final String? label;
  final String? errorMessage;

  const PhoneInput({
    required this.phoneController,
    required this.textInputAction,
    this.label,
    this.errorMessage,
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        readOnly: readOnly,
        inputFormatters: [phoneMaskFormatter],
        style: context.bodyLargeStyle(),
        maxLines: 1,
        controller: phoneController,
        textInputAction: textInputAction,
        decoration: context.phoneInputDecoration(
          hint: label,
          errorMessage: errorMessage,
        ),
        validator: (value) {
          if (value != null &&
              value.isNotEmpty &&
              value.phoneUnmask().length < 9) {
            return null;
          } else {
            return "${translate("error.validation.validation_first")}7${translate("error.validation.validation_second")}";
          }
        },
      ),
    );
  }
}
