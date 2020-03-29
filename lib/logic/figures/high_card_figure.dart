import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class HighCardFigure extends Figure {
  static const _amountOfCards = 1;
  static const _figureBaseValue = 100;

  HighCardFigure(List<CardModel> figureCards)
      : assert(figureCards != null && figureCards.length == _amountOfCards),
        super(figureCards);

  @override
  int figureValue() {
    return _figureBaseValue + figureCards[0].faceValue;
  }

  @override
  bool findFigureInHand(HandModel handModel) {
    bool figureFound = false;

    handModel.cards.forEach((card) {
      if (card.cardFace == figureCards[0].cardFace) figureFound = true;
    });

    return figureFound;
  }

  @override
  int compareTo(Figure other) {
    return figureValue().compareTo(other.figureValue());
  }
}
