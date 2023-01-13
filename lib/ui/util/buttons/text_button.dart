import 'package:flutter/material.dart';
import 'package:flutter_core/util/extensions/text_style_extensions.dart';

class StringButton extends StatelessWidget {
  final String title;
  final bool buttonStatus;
  final Function onClick;

  const StringButton({
    required this.title,
    required this.buttonStatus,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonStatus ? () => onClick() : null,
      child: Text(
        title,
        style: context.textButtonStyle(buttonStatus: buttonStatus),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
      ),
    );
  }
}
