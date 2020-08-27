import 'package:blef/logic/figures/full_house_figure.dart';
import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';
import 'package:test/test.dart';

final handOne = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Four),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Four),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.Five),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Queen),
]);

final handTwo = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Ten),
]);

final handThree = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Ace),
]);

void fullHouseFigureTests() {
  group('Full House tests', () {
    test('assertion error for the same three of kind and pair face', () {
      expect(
        () => FullHouseFigure(CardFace.Five, CardFace.Five),
        throwsA(isA<AssertionError>()),
      );
    });

    test('Full house Ace / Four found in hand one', () {
      final figure = FullHouseFigure(CardFace.Ace, CardFace.Four);

      expect(figure.findFigureInHand(handOne), true);
    });

    test('Full house Four / Ace found in hand one', () {
      final figure = FullHouseFigure(CardFace.Four, CardFace.Ace);

      expect(figure.findFigureInHand(handOne), false);
    });

    test('Full house Ace / Two found in hand one', () {
      final figure = FullHouseFigure(CardFace.Ace, CardFace.Two);

      expect(figure.findFigureInHand(handThree), false);
    });

    test('Full house Jack / Ten found in hand two', () {
      final figure = FullHouseFigure(CardFace.Jack, CardFace.Ten);

      expect(figure.findFigureInHand(handTwo), true);
    });

    test('Full house Ten / Jack found in hand two', () {
      final figure = FullHouseFigure(CardFace.Ten, CardFace.Jack);

      expect(figure.findFigureInHand(handTwo), true);
    });

    test('Full house Ten / Jack value test', () {
      final figure = FullHouseFigure(CardFace.Ten, CardFace.Jack);
      expect(figure.figureValue(), 7151);
    });

    test('Full house Jack / Ten value test', () {
      final figure = FullHouseFigure(CardFace.Jack, CardFace.Ten);
      expect(figure.figureValue(), 7164);
    });

    // test('twos and threes vs one pair of ace', () {
    //   final twoPairs = TwoPairsFigure(CardFace.Two, CardFace.Three);
    //   final onePair = OnePairFigure(CardFace.Ace);

    //   expect(twoPairs.compareTo(onePair), 1);
    // });

    // test('jack nine higher than three four', () {
    //   final twoPairs1 = TwoPairsFigure(CardFace.Jack, CardFace.Nine);
    //   final twoPairs2 = TwoPairsFigure(CardFace.Three, CardFace.Four);

    //   expect(twoPairs1.compareTo(twoPairs2), 1);
    // });

    // test('king queen higher than two queen', () {
    //   final twoPairs1 = TwoPairsFigure(CardFace.King, CardFace.Queen);
    //   final twoPairs2 = TwoPairsFigure(CardFace.Two, CardFace.Queen);

    //   expect(twoPairs1.compareTo(twoPairs2), 1);
    // });

    // test('ace two higher king queen', () {
    //   final twoPairs1 = TwoPairsFigure(CardFace.King, CardFace.Queen);
    //   final twoPairs2 = TwoPairsFigure(CardFace.Two, CardFace.Ace);

    //   expect(twoPairs1.compareTo(twoPairs2), -1);
    // });

    // test('king two higher jack queen', () {
    //   final twoPairs1 = TwoPairsFigure(CardFace.Jack, CardFace.Queen);
    //   final twoPairs2 = TwoPairsFigure(CardFace.Two, CardFace.King);

    //   expect(twoPairs1.compareTo(twoPairs2), -1);
    // });

    // test('Pairs equal', () {
    //   final twoPairs1 = TwoPairsFigure(CardFace.Ten, CardFace.Jack);
    //   final twoPairs2 = TwoPairsFigure(CardFace.Ten, CardFace.Jack);

    //   expect(twoPairs1.compareTo(twoPairs2), 0);
    // });
  });
}
