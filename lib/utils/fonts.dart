import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blef/utils/style/style.dart';

enum FontColor {
  Accent,
  Content,
  White,
  Error,
}

Color _getFontColor(FontColor fontColor) {
  switch (fontColor) {
    case FontColor.Accent:
      return Style.colors.accent;
    case FontColor.White:
      return Style.colors.white;
    case FontColor.Error:
      return Style.colors.error;

    case FontColor.Content:
    default:
      return Style.colors.content;
  }
}

// below sizes are just examples, thay may be adjusted

TextStyle normalFont({
  FontWeight fontWeight = FontWeight.normal,
  FontColor fontColor = FontColor.Content,
}) {
  return TextStyle(
    color: _getFontColor(fontColor),
    fontWeight: fontWeight,
    fontSize: Get.context.isPhone ? 15 : 25,
  );
}

TextStyle smallFont({
  FontWeight fontWeight = FontWeight.normal,
  FontColor fontColor = FontColor.Content,
}) {
  return TextStyle(
    color: _getFontColor(fontColor),
    fontWeight: fontWeight,
    fontSize: Get.context.isPhone ? 13 : 20,
  );
}

TextStyle bigFont({
  FontWeight fontWeight = FontWeight.normal,
  FontColor fontColor = FontColor.Content,
}) {
  return TextStyle(
    color: _getFontColor(fontColor),
    fontWeight: fontWeight,
    fontSize: Get.context.isPhone ? 18 : 28,
  );
}

TextStyle biggerFont({
  FontWeight fontWeight = FontWeight.normal,
  FontColor fontColor = FontColor.Content,
}) {
  return TextStyle(
    color: _getFontColor(fontColor),
    fontWeight: fontWeight,
    fontSize: Get.context.isPhone ? 20 : 32,
  );
}

TextStyle greatFont({
  FontWeight fontWeight = FontWeight.normal,
  FontColor fontColor = FontColor.Content,
}) {
  return TextStyle(
    color: _getFontColor(fontColor),
    fontWeight: fontWeight,
    fontSize: Get.context.isPhone ? 25 : 40,
  );
}
