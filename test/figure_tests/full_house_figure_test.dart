import 'package:blef/logic/figures/flush_figure.dart';
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

void main() {
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

    test('FH 3/2 is higher than FH 2/A', () {
      final fig1 = FullHouseFigure(CardFace.Three, CardFace.Two);
      final fig2 = FullHouseFigure(CardFace.Two, CardFace.Ace);

      expect(fig1.compareTo(fig2), 1);
    });

    test('FH J/K is higher than FH J/Q', () {
      final fig1 = FullHouseFigure(CardFace.Jack, CardFace.King);
      final fig2 = FullHouseFigure(CardFace.Jack, CardFace.Queen);

      expect(fig1.compareTo(fig2), 1);
    });

    test('FH K/5 equals FH K/5', () {
      final fig1 = FullHouseFigure(CardFace.King, CardFace.Five);
      final fig2 = FullHouseFigure(CardFace.King, CardFace.Five);

      expect(fig1.compareTo(fig2), 0);
    });

    test('FH 2/3 is higher than Flush of Spades', () {
      final fig1 = FullHouseFigure(CardFace.Two, CardFace.Three);
      final fig2 = FlushFigure(CardSuit.Spades);

      expect(fig1.compareTo(fig2), 1);
    });
  });
}
