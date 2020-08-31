import 'package:blef/logic/figures/poker_figure.dart';
import 'package:blef/logic/figures/three_of_kind_figure.dart';
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
      final figure = PokerFigure(CardFace.Ace, CardSuit.Clubs);

      expect(figure.findFigureInHand(handTwo), false);
    });

    test('ROYAL POKER (spades) found in hand three', () {
      final figure = PokerFigure(CardFace.Ten, CardSuit.Spades);

      expect(figure.findFigureInHand(handThree), true);
    });

    // test('straight starting from Ace value test', () {
    //   final figure = StraightFigure(CardFace.Ace);

    //   expect(figure.figureValue(), 5001);
    // });

    // test('straight starting from Six value test', () {
    //   final figure = StraightFigure(CardFace.Six);

    //   expect(figure.figureValue(), 5006);
    // });

    // test('Straight from 2 higher than Straight from Ace', () {
    //   final fig1 = StraightFigure(CardFace.Two);
    //   final fig2 = StraightFigure(CardFace.Ace);

    //   expect(fig1.compareTo(fig2), 1);
    // });

    // test('Straight from 10 higher than Straight from 9', () {
    //   final fig1 = StraightFigure(CardFace.Ten);
    //   final fig2 = StraightFigure(CardFace.Nine);

    //   expect(fig1.compareTo(fig2), 1);
    // });

    // test('Straight from 10 equals Straight from 10', () {
    //   final fig1 = StraightFigure(CardFace.Ten);
    //   final fig2 = StraightFigure(CardFace.Ten);

    //   expect(fig1.compareTo(fig2), 0);
    // });

    // test('Straight from Ace higher than Three of Kind of Aces', () {
    //   final fig1 = StraightFigure(CardFace.Ace);
    //   final fig2 = ThreeOfKindFigure(CardFace.Ace);

    //   expect(fig1.compareTo(fig2), 1);
    // });
  });
}
