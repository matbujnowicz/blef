import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class HighCardFigure extends Figure {
  static const _figureBaseValue = 100;

  final CardFace highCardFace;

  HighCardFigure(this.highCardFace);

  @override
  int figureValue() {
    return _figureBaseValue + CardModel.valueForFace(highCardFace);
  }

  @override
  bool findFigureInHand(HandModel handModel) {
    bool figureFound = false;

    handModel.cards.forEach((card) {
      if (card.cardFace == highCardFace) figureFound = true;
    });

    return figureFound;
  }
}
