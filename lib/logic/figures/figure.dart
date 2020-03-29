import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';

abstract class Figure implements Comparable<Figure> {
  final List<CardModel> figureCards;

  bool findFigureInHand(HandModel handModel);

  int figureValue();

  Figure(this.figureCards);
}
