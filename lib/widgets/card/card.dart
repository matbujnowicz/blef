import 'package:flutter/material.dart';

import '../../utils/style_provider/style.dart';

class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 300,
      decoration: BoxDecoration(
        color: Style.of(context).colors.background,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
