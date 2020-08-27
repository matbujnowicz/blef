import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class OnePairFigure extends Figure {
  final FigureType figureType = FigureType.OnePair;
  final CardFace onePairFace;

  OnePairFigure(this.onePairFace);

  @override
  int figureValue() {
    return Figure.valueForFigureType(figureType) +
        CardModel.valueForFace(onePairFace);
  }

  @override
  bool findFigureInHand(HandModel handModel) {
    int faceCardFound = 0;

    handModel.cards.forEach((card) {
      if (card.cardFace == onePairFace) faceCardFound++;
    });

    return faceCardFound >= 2;
  }
}
