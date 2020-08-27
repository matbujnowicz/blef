import 'package:blef/logic/figures/straight_figure.dart';
import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';
import 'package:test/test.dart';

// TODO: new appropriate model (this is for high card)
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
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Queen),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ace),
]);

final handThree = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Queen),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ace),
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

void straightFigureTest() {
  group('Straight tests', () {
    test('assertion error for straight starting from Jack', () {
      expect(
        () => StraightFigure(CardFace.Jack),
        throwsA(isA<AssertionError>()),
      );
    });

    test('assertion error for straight starting from King', () {
      expect(
        () => StraightFigure(CardFace.King),
        throwsA(isA<AssertionError>()),
      );
    });

    test('straight starting from Ace present in hand one', () {
      final figure = StraightFigure(CardFace.Ace);

      expect(figure.findFigureInHand(handOne), true);
    });

    test('straight starting from Ace not present in hand two', () {
      final figure = StraightFigure(CardFace.Ace);

      expect(figure.findFigureInHand(handTwo), false);
    });

    test('straight starting from Ten present in hand two', () {
      final figure = StraightFigure(CardFace.Ten);

      expect(figure.findFigureInHand(handTwo), true);
    });

    test('straight starting from Ten not present in hand one', () {
      final figure = StraightFigure(CardFace.Ten);

      expect(figure.findFigureInHand(handOne), false);
    });
  });
}
