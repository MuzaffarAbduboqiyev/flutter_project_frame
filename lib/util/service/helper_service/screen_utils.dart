import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

bool deviceIsPhone() =>
    SizerUtil.orientation == Orientation.portrait;

double screenWidth() =>
    SizerUtil.width;

double screenHeight() =>
    SizerUtil.height;





