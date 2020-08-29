import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class FourOfKindFigure extends Figure {
  final FigureType figureType = FigureType.FourOfKind;
  final CardFace fourOfKindFace;

  FourOfKindFigure(this.fourOfKindFace);

  @override
  int figureValue() {
    return Figure.valueForFigureType(figureType) +
        CardModel.valueForFace(fourOfKindFace);
  }

  @override
  bool findFigureInHand(HandModel handModel) {
    int faceCardFoudn = 0;

    handModel.cards.forEach((card) {
      if (card.cardFace == fourOfKindFace) faceCardFoudn++;
    });

    return faceCardFoudn >= 4;
  }
}
