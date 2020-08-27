import 'package:blef/logic/figures/high_card_figure.dart';
import 'package:blef/logic/figures/one_pair_figure.dart';
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

void onePairFigureTests() {
  group('One pair tests', () {
    test('Pair of fives not found in  hand one', () {
      final onePair = OnePairFigure(CardFace.Five);

      expect(onePair.findFigureInHand(handOne), false);
    });

    test('Pair of nines not found in  hand one', () {
      final onePair = OnePairFigure(CardFace.Nine);

      expect(onePair.findFigureInHand(handOne), false);
    });

    test('Pair of tens found in  hand two', () {
      final onePair = OnePairFigure(CardFace.Ten);

      expect(onePair.findFigureInHand(handTwo), true);
    });
    test('Pair of Aces found in  hand three', () {
      final onePair = OnePairFigure(CardFace.Ace);

      expect(onePair.findFigureInHand(handThree), true);
    });

    test('Pair of Aces value test', () {
      final onePair = OnePairFigure(CardFace.Ace);

      expect(onePair.figureValue(), 2014);
    });
  });

  test('One pair Jack higher than one pair 10', () {
    final onePair1 = OnePairFigure(CardFace.Jack);
    final onePair2 = OnePairFigure(CardFace.Ten);

    expect(onePair1.compareTo(onePair2), 1);
  });

  test('One pair 10 smaller than One pair Jack', () {
    final onePair1 = OnePairFigure(CardFace.Jack);
    final onePair2 = OnePairFigure(CardFace.Ten);

    expect(onePair2.compareTo(onePair1), -1);
  });

  test('One pair six bigger than HC Queen', () {
    final onePair1 = OnePairFigure(CardFace.Six);
    final onePair2 = HighCardFigure(CardFace.Queen);

    expect(onePair1.compareTo(onePair2), 1);
  });

  test('HC Queen smaller than one pair Six', () {
    final onePair1 = OnePairFigure(CardFace.Six);
    final onePair2 = HighCardFigure(CardFace.Queen);

    expect(onePair2.compareTo(onePair1), -1);
  });

  test('One pair three equal to One pair three', () {
    final onePair1 = OnePairFigure(CardFace.Three);
    final onePair2 = OnePairFigure(CardFace.Three);

    expect(onePair1.compareTo(onePair2), 0);
  });
}
