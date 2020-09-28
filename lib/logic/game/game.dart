import 'package:blef/logic/game/player.dart';
import 'package:blef/logic/game/round.dart';

class Game {
  static const int _edgeHandSize = 5;

  final List<Player> players;
  final List<Round> _rounds = List();

  Game(this.players) {
    _startNewRound();
  }

  bool firstRound() => _rounds.length == 0;

  void _startNewRound() {
    //if player removed - assign prev player as starter
    if (!firstRound()) {
// check if thrown out
    }

    //check finish game

    final startingPlayer = firstRound() ? players[0] : _rounds.last.lostPlayer;
    _rounds.add(
      Round(
        players: players,
        startNewRound: _startNewRound,
        startingPlayer: startingPlayer,
      ),
    );
  }
}
