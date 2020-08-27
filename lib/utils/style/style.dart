import 'package:flutter/material.dart';

part 'style_assets.dart';
part 'style_colors.dart';

abstract class Style {
  static final _Colors colors = _Colors();
  static final _PngAssets pngAssets = _PngAssets();
  static final _SvgAssets svgAssets = _SvgAssets();
}
