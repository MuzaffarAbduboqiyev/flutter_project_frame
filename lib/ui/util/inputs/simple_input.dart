import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/util/extensions/input_decoration_extensions.dart';
import 'package:flutter_core/util/extensions/text_style_extensions.dart';
import 'package:flutter_core/util/service/helper_service/translator.dart';

class SimpleInput extends StatelessWidget {
  final TextEditingController inputController;
  final String label;
  final String? errorMessage;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int maxLines;
  final int minLines;
  final TextInputAction textInputAction;
  final bool loadingStatus;
  final bool hasValidation;
  final int validationLength;

  const SimpleInput({
    required this.inputController,
    required this.label,
    required this.textInputAction,
    this.loadingStatus = false,
    this.readOnly = false,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines = 1,
    this.errorMessage,
    this.hasValidation = false,
    this.validationLength = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextFormField(
        keyboardType: keyboardType,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        style: context.bodyLargeStyle(),
        maxLines: maxLines,
        minLines: minLines,
        textInputAction: textInputAction,
        controller: inputController,
        decoration: context.simpleInputDecoration(
          loadingStatus: loadingStatus,
          hint: label,
          errorMessage: errorMessage,
        ),
        validator: (value) {
          if (hasValidation) {
            if (validationLength == 0) {
              if (value != null && value.isNotEmpty) {
                return null;
              } else {
                return translate("error.validation.empty");
              }
            } else {
              if (value != null && value.length >= validationLength) {
                return null;
              } else {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return "${translate("error.validation.validation_first")}$validationLength${translate("error.validation.validation_second")}";
                }
              }
            }
          } else {
            return null;
          }
        },
      ),
    );
  }
}
