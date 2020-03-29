import 'package:blef/logic/models/hand/hand_model.dart';
import 'package:blef/widgets/hand_widget/hand_widget.dart';
import 'package:flutter/material.dart';

class GameItems extends StatelessWidget {
  final HandModel handModel;

  const GameItems({Key key, this.handModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: HandWidget(
            handModel,
          )),
      margin: const EdgeInsets.only(bottom: 10),
    );
  }
}
