import 'package:flutter/material.dart';
import 'package:flutter_core/ui/util/loaders/info_loader.dart';
import 'package:flutter_core/util/extensions/theme_extensions.dart';
import 'package:flutter_core/util/service/helper_service/translator.dart';

extension InputDecorationExtensions on BuildContext {
  /// Phone input decoration
  InputDecoration phoneInputDecoration({
    String? hint,
    String? errorMessage,
    double borderRadius = 12,
  }) =>
      InputDecoration(
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(left: 16.0, right: 8, top: 0, bottom: 0),
          child: Text(
            "+998 ",
            style: currentTheme().textTheme.bodyLarge,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        label: Text(
          hint ?? translate("auth.login.phone"),
          style: currentTheme().textTheme.labelLarge,
        ),
        errorText: (errorMessage != null && errorMessage.isNotEmpty)
            ? errorMessage
            : null,
      );

  /// Password input decoration
  InputDecoration passwordInputDecoration({
    required Function onChangeObscure,
    required bool isPasswordObscure,
    String? hint,
    String? errorMessage,
    double borderRadius = 12,
  }) {
    return InputDecoration(
      label: Text(
        hint ?? translate("auth.login.password"),
        style: currentTheme().textTheme.labelLarge,
      ),
      errorText: (errorMessage != null && errorMessage.isNotEmpty == true)
          ? errorMessage
          : null,
      suffixIcon: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 16),
          child: Icon(
            (isPasswordObscure) ? Icons.visibility : Icons.visibility_off,
            color: currentTheme().hintColor,
          ),
        ),
        onTap: () => onChangeObscure(),
      ),
      suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    );
  }

  /// Loading input decoration
  /// Password input decoration
  InputDecoration simpleInputDecoration({
    required bool loadingStatus,
    required String hint,
    String? errorMessage,
    double borderRadius = 12,
  }) {
    return InputDecoration(
      label: Text(
        hint,
        style: currentTheme().textTheme.labelLarge,
      ),
      errorText: (errorMessage != null && errorMessage.isNotEmpty == true)
          ? errorMessage
          : null,
      suffixIcon: (loadingStatus)
          ? const Padding(
              padding: EdgeInsets.only(left: 8, right: 16),
              child: InfoLoader(),
            )
          : null,
      suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    );
  }

  /// Loading input decoration
  /// Password input decoration
  InputDecoration mapInputDecoration({
    required String hint,
    String? errorMessage,
    double borderRadius = 12,
  }) {
    return InputDecoration(
      label: Text(
        hint,
        style: currentTheme().textTheme.labelLarge,
      ),
      errorText: (errorMessage != null && errorMessage.isNotEmpty == true)
          ? errorMessage
          : null,
      suffixIcon: const Padding(
        padding: EdgeInsets.only(left: 8, right: 16),
        child: Icon(
          Icons.location_on,
          color: Colors.red,
        ),
      ),
      suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    );
  }


}
