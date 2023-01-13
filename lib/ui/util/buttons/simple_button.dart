import 'package:flutter/material.dart';
import 'package:flutter_core/util/extensions/text_style_extensions.dart';
import 'package:flutter_core/util/extensions/theme_extensions.dart';
import 'package:flutter_core/util/theme/colors.dart';

class SimpleButton extends StatelessWidget {
  final String title;
  final Function onClick;
  final bool buttonStatus;

  const SimpleButton({
    required this.title,
    required this.onClick,
    required this.buttonStatus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: buttonStatus ? () => onClick.call() : null,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor:
            buttonStatus ? buttonColor : context.currentTheme().disabledColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: context.customStyle(
            color: Colors.white,
            textSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SimpleBackButton extends StatelessWidget {
  final String title;
  final Function onClick;

  const SimpleBackButton({
    required this.title,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onClick.call(),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: context.currentTheme().dividerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: context.customStyle(
            color: Colors.white,
            textSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
