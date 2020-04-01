import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class OnePairFigure extends Figure {
  static const _figureBaseValue = 200;

  final CardFace onePairFace;

  OnePairFigure(this.onePairFace);

  @override
  int figureValue() {
    return _figureBaseValue + CardModel.valueForFace(onePairFace);
  }

  @override
  bool findFigureInHand(HandModel handModel) {
    int faceCardFoudn = 0;

    handModel.cards.forEach((card) {
      if (card.cardFace == onePairFace) faceCardFoudn++;
    });

    return faceCardFoudn >= 2;
  }
}
