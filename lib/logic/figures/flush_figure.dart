import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

import 'figure.dart';

class FlushFigure extends Figure {
  final FigureType figureType = FigureType.Flush;
  final CardSuit cardSuit;

  FlushFigure(this.cardSuit);

  @override
  int figureValue() {
    return Figure.valueForFigureType(figureType) +
        CardModel.valueForSuit(cardSuit);
  }

  @override
  bool findFigureInHand(HandModel handModel) {
    int figureFoundCount = 0;

    handModel.cards.forEach((card) {
      if (card.cardSuit == cardSuit) figureFoundCount++;
    });

    return figureFoundCount >= 5;
  }
}
