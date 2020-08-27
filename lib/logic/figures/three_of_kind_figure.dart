import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class ThreeOfKindFigure extends Figure {
  final FigureType figureType = FigureType.ThreeOfKind;
  final CardFace threeOfKindFace;

  ThreeOfKindFigure(this.threeOfKindFace);

  @override
  int figureValue() {
    return Figure.valueForFigureType(figureType) +
        CardModel.valueForFace(threeOfKindFace);
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
