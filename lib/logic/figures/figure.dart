import 'package:blef/logic/models/hand/hand_model.dart';

enum FigureType {
  HighCard,
  OnePair,
  TwoPairs,
  ThreeOfKind,
  Straight,
  Flush,
  FullHouse,
  FourOfKind,
  Poker,
}

abstract class Figure implements Comparable<Figure> {
  bool findFigureInHand(HandModel handModel);

  int figureValue();

  static int valueForFigureType(FigureType figureType) {
    final allFigureTypes = FigureType.values;
    int index = allFigureTypes.indexOf(figureType);
    index++;
    return index * 1000;
  }

  @override
  int compareTo(Figure other) {
    return figureValue().compareTo(other.figureValue());
  }
}
