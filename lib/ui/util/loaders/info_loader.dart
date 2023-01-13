import 'package:flutter/material.dart';
import 'package:flutter_core/util/theme/colors.dart';

class InfoLoader extends StatelessWidget {
  const InfoLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(buttonColor),
      ),
    );
  }
}
