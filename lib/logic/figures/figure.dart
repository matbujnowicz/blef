import 'package:blef/logic/models/hand/hand_model.dart';

abstract class Figure implements Comparable<Figure> {
  bool findFigureInHand(HandModel handModel);

  int figureValue();

  @override
  int compareTo(Figure other) {
    return figureValue().compareTo(other.figureValue());
  }
}
