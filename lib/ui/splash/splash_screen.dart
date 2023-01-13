import 'package:flutter/material.dart';
import 'package:flutter_core/util/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: SvgPicture.asset(
          "assets/img/launcher_icon.svg",
        ),
      ),
    );
  }
}
