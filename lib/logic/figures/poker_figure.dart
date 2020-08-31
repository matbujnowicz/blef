import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class PokerFigure extends Figure {
  final FigureType figureType = FigureType.Poker;
  final CardFace fromCardFace;
  final CardSuit cardSuit;

  PokerFigure(this.fromCardFace, this.cardSuit)
      : assert(
          fromCardFace == CardFace.Ace ||
              CardModel.valueForFace(fromCardFace) <=
                  CardModel.valueForFace(CardFace.Ten),
        );

  @override
  int figureValue() {
    final figureBaseValue = Figure.valueForFigureType(figureType);
    if (fromCardFace == CardFace.Ace) return figureBaseValue + 1;
    return figureBaseValue + CardModel.valueForFace(fromCardFace);
  }

  @override
  bool findFigureInHand(HandModel handModel) {
    bool figureFound = true;

    List<CardFace> straightCardsFaces;
    final allFaces = CardFace.values;

    if (fromCardFace == CardFace.Ace) {
      straightCardsFaces = allFaces.sublist(
        0,
        4,
      );
      straightCardsFaces.insert(0, CardFace.Ace);
    } else {
      final fromCardFaceIndex = allFaces.indexOf(fromCardFace);
      straightCardsFaces = allFaces.sublist(
        fromCardFaceIndex,
        fromCardFaceIndex + 5,
      );
    }

    if (straightCardsFaces.length != 5)
      throw Exception("Straight should consist of 5 cards");

    straightCardsFaces.forEach((expectedCardFace) {
      bool expectedCardFaceFound = false;
      handModel.cards.forEach((presentCard) {
        if (presentCard.cardFace == expectedCardFace &&
            presentCard.cardSuit == cardSuit) expectedCardFaceFound = true;
      });
      if (!expectedCardFaceFound) figureFound = false;
    });

    return figureFound;
  }
}
