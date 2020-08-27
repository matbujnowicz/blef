import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class FullHouseFigure extends Figure {
  final FigureType figureType = FigureType.TwoPairs;
  final CardFace threeOfKindFace;
  final CardFace pairFace;
  final _majorFaceMultiplier = CardModel.valueForFace(CardFace.Ace);

  FullHouseFigure(this.threeOfKindFace, this.pairFace)
      : assert(threeOfKindFace != pairFace);

  @override
  int figureValue() {
    final threeOfKindFaceValue = CardModel.valueForFace(threeOfKindFace);
    final pairFaceValue = CardModel.valueForFace(pairFace);
    final figureBaseValue = Figure.valueForFigureType(figureType);

    return figureBaseValue +
        threeOfKindFaceValue * _majorFaceMultiplier +
        pairFaceValue;
  }

  @override
  bool findFigureInHand(HandModel handModel) {
    int threeOfKindFaceFound = 0;
    int pairFaceFound = 0;

    handModel.cards.forEach((card) {
      if (card.cardFace == threeOfKindFace) threeOfKindFaceFound++;
      if (card.cardFace == pairFace) pairFaceFound++;
    });

    return threeOfKindFaceFound >= 3 && pairFaceFound >= 2;
  }
}
