import 'package:flutter/material.dart';
import 'package:flutter_core/util/extensions/decoration_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../util/const/sizes.dart';
import '../../util/service/helper_service/screen_utils.dart';
import '../util/scrolling/custom_scroll_behavior.dart';
import '../util/size_box/size_boxes.dart';
import 'logo.dart';

class CenterBody extends StatelessWidget {
  final bool hasLogo;
  final Widget child;

  const CenterBody({
    required this.hasLogo,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            margin:  EdgeInsets.symmetric(
              vertical: deviceIsPhone() ? 1.h : 10.h,
              horizontal: deviceIsPhone() ? 1.w : 10.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (hasLogo) const Logo(),
                if (hasLogo) verticalLargeBox(),
                Container(
                  padding: const EdgeInsets.all(normalSize),
                  decoration:
                      deviceIsPhone() ? null : context.containerDecoration(),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
