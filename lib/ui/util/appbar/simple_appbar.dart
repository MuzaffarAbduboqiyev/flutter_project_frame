import 'package:flutter/material.dart';
import 'package:flutter_core/util/extensions/text_style_extensions.dart';
import 'package:flutter_core/util/extensions/theme_extensions.dart';
import 'package:sizer/sizer.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const SimpleAppbar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: context.currentTheme().appBarTheme.backgroundColor,
      title: Text(
        title ?? "",
        style: context.appbarStyle(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      toolbarHeight: (20.sp + 32),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(20.sp + 32);
}
