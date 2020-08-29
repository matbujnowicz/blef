import 'package:blef/logic/figures/one_pair_figure.dart';
import 'package:blef/logic/figures/two_pairs_figure.dart';
import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';
import 'package:test/test.dart';

final handOne = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Four),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.Five),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Queen),
]);

final handTwo = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Ten),
]);

final handThree = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Ace),
]);

void main() {
  group('Two pairs tests', () {
    test('assertion error for the same two pairs', () {
      expect(
        () => TwoPairsFigure(CardFace.Five, CardFace.Five),
        throwsA(isA<AssertionError>()),
      );
    });

    test('Pair of fives and Aces not found in  hand one', () {
      final twoPairs = TwoPairsFigure(CardFace.Five, CardFace.Ace);

      expect(twoPairs.findFigureInHand(handOne), false);
    });

    test('Pair of tens and jacks found in  hand two', () {
      final twoPairs = TwoPairsFigure(CardFace.Jack, CardFace.Ten);

      expect(twoPairs.findFigureInHand(handTwo), true);
    });

    test('Pair of tens and jacks found in  hand two [opposite placed]', () {
      final twoPairs = TwoPairsFigure(CardFace.Ten, CardFace.Jack);

      expect(twoPairs.findFigureInHand(handTwo), true);
    });

    test('Pair of Aces and twos value test', () {
      final twoPairs = TwoPairsFigure(CardFace.Ace, CardFace.Two);
      expect(twoPairs.figureValue(), 3198);
    });

    test('twos and threes vs one pair of ace', () {
      final twoPairs = TwoPairsFigure(CardFace.Two, CardFace.Three);
      final onePair = OnePairFigure(CardFace.Ace);

      expect(twoPairs.compareTo(onePair), 1);
    });

    test('jack nine higher than three four', () {
      final twoPairs1 = TwoPairsFigure(CardFace.Jack, CardFace.Nine);
      final twoPairs2 = TwoPairsFigure(CardFace.Three, CardFace.Four);

      expect(twoPairs1.compareTo(twoPairs2), 1);
    });

    test('king queen higher than two queen', () {
      final twoPairs1 = TwoPairsFigure(CardFace.King, CardFace.Queen);
      final twoPairs2 = TwoPairsFigure(CardFace.Two, CardFace.Queen);

      expect(twoPairs1.compareTo(twoPairs2), 1);
    });

    test('ace two higher king queen', () {
      final twoPairs1 = TwoPairsFigure(CardFace.King, CardFace.Queen);
      final twoPairs2 = TwoPairsFigure(CardFace.Two, CardFace.Ace);

      expect(twoPairs1.compareTo(twoPairs2), -1);
    });

    test('king two higher jack queen', () {
      final twoPairs1 = TwoPairsFigure(CardFace.Jack, CardFace.Queen);
      final twoPairs2 = TwoPairsFigure(CardFace.Two, CardFace.King);

      expect(twoPairs1.compareTo(twoPairs2), -1);
    });

    test('Pairs equal', () {
      final twoPairs1 = TwoPairsFigure(CardFace.Ten, CardFace.Jack);
      final twoPairs2 = TwoPairsFigure(CardFace.Ten, CardFace.Jack);

      expect(twoPairs1.compareTo(twoPairs2), 0);
    });
  });
}
