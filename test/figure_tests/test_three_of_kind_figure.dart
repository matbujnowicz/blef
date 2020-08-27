import 'package:blef/logic/figures/three_of_kind_figure.dart';
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
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
]);

final handThree = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
]);

void threeOfKindFigureTest() {
  group('three of kind tests', () {
    test('3of kind not pres in hand one', () {
      final figure = ThreeOfKindFigure(CardFace.Ace);

      expect(figure.findFigureInHand(handOne), false);
    });

    test('3of kind not pres in hand two', () {
      final figure = ThreeOfKindFigure(CardFace.Jack);

      expect(figure.findFigureInHand(handTwo), false);
    });

    test('3of kind pres in hand thre', () {
      final figure = ThreeOfKindFigure(CardFace.King);

      expect(figure.findFigureInHand(handThree), true);
    });

    test('3of kind value test', () {
      final figure = ThreeOfKindFigure(CardFace.Two);

      expect(figure.figureValue(), 602);
    });

    test('queens higher than twos', () {
      final fig1 = ThreeOfKindFigure(CardFace.Queen);
      final fig2 = ThreeOfKindFigure(CardFace.Ten);

      expect(fig1.compareTo(fig2), 1);
    });

    test('queens smaller than kings', () {
      final fig1 = ThreeOfKindFigure(CardFace.Queen);
      final fig2 = ThreeOfKindFigure(CardFace.King);

      expect(fig1.compareTo(fig2), -1);
    });

    test('3twos higher than pair of aces and kings', () {
      final fig1 = ThreeOfKindFigure(CardFace.Two);
      final fig2 = TwoPairsFigure(CardFace.Ace, CardFace.King);

      expect(fig1.compareTo(fig2), 1);
    });
  });
}
