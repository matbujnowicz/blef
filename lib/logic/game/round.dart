import 'package:blef/logic/figures/figure.dart';
import 'package:blef/logic/game/player.dart';
import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';
import 'package:flutter/material.dart';

class Round {
  final List<Player> players;
  final VoidCallback startNewRound;

  Player _currentPlayer;
  Figure _bidFigure;
  Player _lostPlayer;

  Player get currentPlayer => _currentPlayer;
  Player get lostPlayer => _lostPlayer;
  Figure get bidFigure => _bidFigure;

  Round({
    @required this.players,
    @required this.startNewRound,
    @required Player startingPlayer,
  }) : _currentPlayer = startingPlayer;

  void fetchPlayersWithCards() {
    //TODO:
  }

  void _nextPlayer() {
    int index = players.indexOf(_currentPlayer);
    index++;
    if (index == players.length) index = 0;
    _currentPlayer = players[index];
  }

  Player _getPrevPlayer() {
    int index = players.indexOf(_currentPlayer);
    index--;
    if (index == 0) index = players.length - 1;
    return players[index];
  }

  bool isNewBidPossible(Figure newBid) => newBid.compareTo(_bidFigure) == 1;

  void bid(Figure newBid) {
    assert(isNewBidPossible(newBid));
    _bidFigure = newBid;
    _nextPlayer();
  }

  void check() {
    final allCards = List<CardModel>();
    players.forEach((player) => allCards.addAll(player.hand.cards));
    final totalHand = HandModel(allCards);

    if (_bidFigure.findFigureInHand(totalHand))
      _loose(_currentPlayer);
    else
      _loose(_getPrevPlayer());
  }

  void _loose(Player player) {
    player.incrementHandSize();
    _lostPlayer = player;
    startNewRound();
  }
}
