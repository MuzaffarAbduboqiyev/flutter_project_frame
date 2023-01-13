import 'package:flutter/material.dart';

final lightPrimaryColor = HexColor.fromHex("#313D65");
final primaryColor = HexColor.fromHex("#313D65");
final backgroundColor = HexColor.fromHex("#2F343B");
final lightBackgroundColor = HexColor.fromHex("#FFFFFF");
final textColor = HexColor.fromHex("#FFFFFF");
final lightTextColor = HexColor.fromHex("#212529");
final hintColor = HexColor.fromHex("#ADB5BD");
final lightHintColor = HexColor.fromHex("#7E858C");
final selectedColor = HexColor.fromHex("#4D5867");
final cardColor = HexColor.fromHex("#2F343B");
final lightCardColor = HexColor.fromHex("#FFFFFF");
final buttonColor = HexColor.fromHex("#0496FF");
final cancelColor = HexColor.fromHex("#FA8684");
final dividerColor = HexColor.fromHex("#434C57");
final subtitleColor = HexColor.fromHex("#6C757D");
final waitingColor = HexColor.fromHex("#FADB64");
final successColor = HexColor.fromHex("#64FA9D");
final disableButtonColor = HexColor.fromHex("#464D57");
final lightDisableButtonColor = HexColor.fromHex("#DEE1E5");
final appbarColor = HexColor.fromHex("#373D45");
final incomingColor = HexColor.fromHex("#96A1B5");

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
