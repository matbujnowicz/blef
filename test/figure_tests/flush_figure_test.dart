import 'package:blef/logic/figures/flush_figure.dart';
import 'package:blef/logic/figures/straight_figure.dart';
import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';
import 'package:test/test.dart';

final handOne = HandModel([
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Ace),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Four),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Three),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.Five),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Queen),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
]);

final handTwo = HandModel([
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Queen),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ace),
]);
void main() {
  group('Flush tests', () {
    test('diamonds flush present in hand one', () {
      final figure = FlushFigure(CardSuit.Diamonds);

      expect(figure.findFigureInHand(handOne), true);
    });

    test('diamonds flush not present in hand two', () {
      final figure = FlushFigure(CardSuit.Diamonds);

      expect(figure.findFigureInHand(handTwo), false);
    });

    test('spades flush not present in hand one', () {
      final figure = FlushFigure(CardSuit.Spades);

      expect(figure.findFigureInHand(handOne), false);
    });

    test('spades flush present in hand two', () {
      final figure = FlushFigure(CardSuit.Spades);

      expect(figure.findFigureInHand(handTwo), true);
    });

    test('spades flush value test', () {
      final figure = FlushFigure(CardSuit.Spades);

      expect(figure.figureValue(), 6004);
    });

    test('clubs flush value test', () {
      final figure = FlushFigure(CardSuit.Clubs);

      expect(figure.figureValue(), 6001);
    });

    test('Flush hearts higher than flush from diamonds', () {
      final fig1 = FlushFigure(CardSuit.Hearts);
      final fig2 = FlushFigure(CardSuit.Diamonds);

      expect(fig1.compareTo(fig2), 1);
    });

    test('Straight from 10 higher than Straight from 9', () {
      final fig1 = FlushFigure(CardSuit.Clubs);
      final fig2 = StraightFigure(CardFace.Ten);

      expect(fig1.compareTo(fig2), 1);
    });
  });
}
