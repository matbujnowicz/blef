import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class ThreeOfKindFigure extends Figure {
  static const _figureBaseValue = 600;

  final CardFace threeOfKindFace;

  ThreeOfKindFigure(this.threeOfKindFace);

  @override
  int figureValue() {
    return _figureBaseValue + CardModel.valueForFace(threeOfKindFace);
  }

  @override
  bool findFigureInHand(HandModel handModel) {
    int faceCardFoudn = 0;

    handModel.cards.forEach((card) {
      if (card.cardFace == threeOfKindFace) faceCardFoudn++;
    });

    return faceCardFoudn >= 3;
  }
}
