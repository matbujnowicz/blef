import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class TwoPairsFigure extends Figure {
  static const _figureBaseValue = 300;
  static const _higherFaceMultiplier = 14;

  final CardFace firstPairFace;
  final CardFace secondPairFace;

  TwoPairsFigure(this.firstPairFace, this.secondPairFace)
      : assert(firstPairFace != secondPairFace);

  @override
  int figureValue() {
    final firstPairFaceValue = CardModel.valueForFace(firstPairFace);
    final secondPairFaceValue = CardModel.valueForFace(secondPairFace);
    if (firstPairFaceValue > secondPairFaceValue)
      return _figureBaseValue +
          firstPairFaceValue * _higherFaceMultiplier +
          secondPairFaceValue;
    return _figureBaseValue +
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
