import 'package:flutter/material.dart';

enum CardSuit {
  Spades,
  Hearts,
  Diamonds,
  Clubs,
}

enum CardFace {
  Ace,
  King,
  Queen,
  Jack,
  Ten,
  Nine,
  Eight,
  Seven,
  Six,
  Five,
  Four,
  Three,
  Two,
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
    switch (face) {
      case CardFace.Ace:
        return 14;
      case CardFace.King:
        return 13;
      case CardFace.Queen:
        return 12;
      case CardFace.Jack:
        return 11;
      case CardFace.Ten:
        return 10;
      case CardFace.Nine:
        return 9;
      case CardFace.Eight:
        return 8;
      case CardFace.Seven:
        return 7;
      case CardFace.Six:
        return 6;
      case CardFace.Five:
        return 5;
      case CardFace.Four:
        return 4;
      case CardFace.Three:
        return 3;
      case CardFace.Two:
        return 2;
      default:
        return -1;
    }
  }

  static int valueForSuit(CardSuit suit) {
    switch (suit) {
      case CardSuit.Spades:
        return 3;
      case CardSuit.Hearts:
        return 2;
      case CardSuit.Diamonds:
        return 1;
      case CardSuit.Clubs:
        return 0;
      default:
        return -1;
    }
  }
}
