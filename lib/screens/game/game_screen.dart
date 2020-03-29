import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';
import 'package:flutter/material.dart';

import 'game_items.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final HandModel handModel = HandModel([
    CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Ace),
    CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Four),
    CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.Five),
    CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Queen),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF228B22), Color(0xFF32CD32)],
            )),
          ),
          Container(
            padding: MediaQuery.of(context).viewPadding,
            child: GameItems(handModel: handModel),
          )
        ],
      ),
    );
  }
}
