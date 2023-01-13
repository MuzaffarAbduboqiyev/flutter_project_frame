import 'package:flutter/material.dart';
import 'package:flutter_core/util/extensions/input_decoration_extensions.dart';
import 'package:flutter_core/util/extensions/text_style_extensions.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController passwordController;
  final TextInputAction textInputAction;
  final bool isPasswordObscure;
  final Function onChangeObscure;
  final String? errorMessage;
  final String? label;
  final bool readOnly;

  const PasswordInput({
    required this.passwordController,
    required this.isPasswordObscure,
    required this.onChangeObscure,
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
        obscureText: isPasswordObscure,
        readOnly: readOnly,
        style: context.bodyLargeStyle(),
        controller: passwordController,
        textInputAction: textInputAction,
        maxLines: 1,
        decoration: context.passwordInputDecoration(
          onChangeObscure: onChangeObscure,
          isPasswordObscure: isPasswordObscure,
          hint: label,
        ),
      ),
    );
  }
}
