import 'package:blef/models/hand/hand_model.dart';
import 'package:blef/widgets/card_widget/card_widget.dart';
import 'package:flutter/material.dart';

class HandWidget extends StatelessWidget {
  final HandModel handModel;

  const HandWidget(this.handModel);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _getCards(),
    );
  }

  List<Widget> _getCards() {
    List<Widget> cards = List();
    handModel.cards.forEach((card) {
      cards.add(CardWidget(card));
      cards.add(SizedBox(
        width: 10,
      ));
    });
    return cards;
  }
}
