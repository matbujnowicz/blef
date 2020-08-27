import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class TwoPairsFigure extends Figure {
  static const _higherFaceMultiplier = 14;

  final FigureType figureType = FigureType.TwoPairs;
  final CardFace firstPairFace;
  final CardFace secondPairFace;

  TwoPairsFigure(this.firstPairFace, this.secondPairFace)
      : assert(firstPairFace != secondPairFace);

  @override
  int figureValue() {
    final firstPairFaceValue = CardModel.valueForFace(firstPairFace);
    final secondPairFaceValue = CardModel.valueForFace(secondPairFace);
    final figureBaseValue = Figure.valueForFigureType(figureType);

    if (firstPairFaceValue > secondPairFaceValue)
      return figureBaseValue +
          firstPairFaceValue * _higherFaceMultiplier +
          secondPairFaceValue;
    return figureBaseValue +
        secondPairFaceValue * _higherFaceMultiplier +
        firstPairFaceValue;
  }

  @override
  bool findFigureInHand(HandModel handModel) {
    int firstFaceCardFound = 0;
    int secondFaceCardFound = 0;

    handModel.cards.forEach((card) {
      if (card.cardFace == firstPairFace) firstFaceCardFound++;
      if (card.cardFace == secondPairFace) secondFaceCardFound++;
    });

    return firstFaceCardFound >= 2 && secondFaceCardFound >= 2;
  }
}
