import 'package:blef/logic/models/hand/hand_model.dart';

class Player {
  final String name;

  HandModel _hand;
  int _handSize = 1;

  Player(this.name);

  HandModel get hand => _hand;

  int get handSize => _handSize;

  set hand(HandModel handModel) {
    assert(handModel.size() == _handSize);
    _hand = handModel;
  }

  void incrementHandSize() => _handSize++;
}
