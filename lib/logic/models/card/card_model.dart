import 'package:flutter/material.dart';

enum CardSuit {
  Clubs,
  Diamonds,
  Hearts,
  Spades,
}

enum CardFace {
  Two,
  Three,
  Four,
  Five,
  Six,
  Seven,
  Eight,
  Nine,
  Ten,
  Jack,
  Queen,
  King,
  Ace,
}

class CardModel {
  final CardSuit cardSuit;
  final CardFace cardFace;
  final int suitValue;
  final int faceValue;

  CardModel({
    @required this.cardSuit,
    @required this.cardFace,
  })  : suitValue = valueForSuit(cardSuit),
        faceValue = valueForFace(cardFace);

  static int valueForFace(CardFace face) {
    final allCardFaces = CardFace.values;
    int index = allCardFaces.indexOf(face);
    return index + 2;
  }

  static int valueForSuit(CardSuit suit) {
    final allCardSuits = CardSuit.values;
    int index = allCardSuits.indexOf(suit);
    return index + 1;
  }
}
