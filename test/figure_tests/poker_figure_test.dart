import 'package:blef/logic/figures/four_of_kind_figure.dart';
import 'package:blef/logic/figures/poker_figure.dart';
import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';
import 'package:test/test.dart';

final handOne = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Four),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Three),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.Five),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Queen),
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
]);

final handTwo = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Four),
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Three),
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Five),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Queen),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
]);

final handThree = HandModel([
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Queen),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ace),
]);

void main() {
  group('Poker tests', () {
    test('assertion error for poker starting from Jack', () {
      expect(
        () => PokerFigure(CardFace.Jack, CardSuit.Clubs),
        throwsA(isA<AssertionError>()),
      );
    });

    test('assertion error for poker starting from King', () {
      expect(
        () => PokerFigure(CardFace.King, CardSuit.Clubs),
        throwsA(isA<AssertionError>()),
      );
    });

    test('poker Ace/clubs not present in hand one', () {
      final figure = PokerFigure(CardFace.Ace, CardSuit.Clubs);

      expect(figure.findFigureInHand(handOne), false);
    });

    test('poker Ace/clubs present in hand two', () {
      final figure = PokerFigure(CardFace.Ace, CardSuit.Clubs);

      expect(figure.findFigureInHand(handTwo), true);
    });

    test('poker Ace/diamonds not present in hand two', () {
      final figure = PokerFigure(CardFace.Ace, CardSuit.Diamonds);

      expect(figure.findFigureInHand(handTwo), false);
    });

    test('ROYAL POKER (spades) found in hand three', () {
      final figure = PokerFigure(CardFace.Ten, CardSuit.Spades);

      expect(figure.findFigureInHand(handThree), true);
    });

    test('ROYAL POKER value test', () {
      final figure = PokerFigure(CardFace.Ten, CardSuit.Spades);

      expect(figure.figureValue(), 9066);
    });

    test('Weakest poker is higher than four Aces', () {
      final figure1 = PokerFigure(CardFace.Ace, CardSuit.Clubs);
      final figure2 = FourOfKindFigure(CardFace.Ace);

      expect(figure1.compareTo(figure2), 1);
    });

    test('Weakest poker is equal to weakst poker', () {
      final figure1 = PokerFigure(CardFace.Ace, CardSuit.Clubs);
      final figure2 = PokerFigure(CardFace.Ace, CardSuit.Clubs);

      expect(figure1.compareTo(figure2), 0);
    });

    test('lowest diamnonds is higher than royal clubs is', () {
      final figure1 = PokerFigure(CardFace.Ace, CardSuit.Diamonds);
      final figure2 = PokerFigure(CardFace.Ten, CardSuit.Clubs);

      expect(figure1.compareTo(figure2), 1);
    });

    test('8 spades is higher than 7 spades', () {
      final figure1 = PokerFigure(CardFace.Eight, CardSuit.Spades);
      final figure2 = PokerFigure(CardFace.Seven, CardSuit.Spades);

      expect(figure1.compareTo(figure2), 1);
    });

    test('8 spades is higher than 8 hearts', () {
      final figure1 = PokerFigure(CardFace.Eight, CardSuit.Spades);
      final figure2 = PokerFigure(CardFace.Seven, CardSuit.Hearts);

      expect(figure1.compareTo(figure2), 1);
    });
  });
}
