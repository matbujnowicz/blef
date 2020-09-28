import 'package:blef/logic/figures/figure.dart';
import 'package:blef/logic/models/card/card_model.dart';

class HandModel {
  final List<CardModel> cards;
  final _foundFigures = List<Figure>();

  List<Figure> foundFigures() => _foundFigures;

  void addFoundFigure(Figure figure) => _foundFigures.add(figure);

  bool isThisFigureFound(Figure figure) => _foundFigures.contains(figure);

  int size() => cards.length;

  HandModel(this.cards);
}
