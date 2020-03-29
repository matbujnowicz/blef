import 'package:blef/logic/figures/high_card_figure.dart';
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
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
]);

void highCardFigureTests() {
  group('High card tests', () {
    test('HC Ace present in  hand one', () {
      final highCardAce = HighCardFigure(
          [CardModel(cardFace: CardFace.Ace, cardSuit: CardSuit.Diamonds)]);

      expect(highCardAce.findFigureInHand(handOne), true);
    });

    test('HC King not present in  hand one', () {
      final highCardKing = HighCardFigure(
          [CardModel(cardFace: CardFace.King, cardSuit: CardSuit.Diamonds)]);

      expect(highCardKing.findFigureInHand(handOne), false);
    });

    test('HC Ace not present in  hand two', () {
      final highCardAce = HighCardFigure(
          [CardModel(cardFace: CardFace.Ace, cardSuit: CardSuit.Spades)]);

      expect(highCardAce.findFigureInHand(handTwo), false);
    });

    test('HC King present in  hand two', () {
      final highCardKing = HighCardFigure(
          [CardModel(cardFace: CardFace.King, cardSuit: CardSuit.Hearts)]);

      expect(highCardKing.findFigureInHand(handTwo), true);
    });

    test('HC Jack value test', () {
      final highCardKing = HighCardFigure(
          [CardModel(cardFace: CardFace.Jack, cardSuit: CardSuit.Hearts)]);

      expect(highCardKing.figureValue(), 111);
    });

    test('HC Jack higher than HC 10', () {
      final highCardJack = HighCardFigure(
          [CardModel(cardFace: CardFace.Jack, cardSuit: CardSuit.Hearts)]);
      final highCardTen = HighCardFigure(
          [CardModel(cardFace: CardFace.Ten, cardSuit: CardSuit.Hearts)]);

      expect(highCardJack.compareTo(highCardTen), 1);
    });

    test('HC 10 smaller than HC Jack', () {
      final highCardJack = HighCardFigure(
          [CardModel(cardFace: CardFace.Jack, cardSuit: CardSuit.Hearts)]);
      final highCardTen = HighCardFigure(
          [CardModel(cardFace: CardFace.Ten, cardSuit: CardSuit.Hearts)]);

      expect(highCardTen.compareTo(highCardJack), -1);
    });

    test('HC six smaller than HC Queen', () {
      final hc6 = HighCardFigure(
          [CardModel(cardFace: CardFace.Six, cardSuit: CardSuit.Hearts)]);
      final hcQueen = HighCardFigure(
          [CardModel(cardFace: CardFace.Queen, cardSuit: CardSuit.Hearts)]);

      expect(hc6.compareTo(hcQueen), -1);
    });

    test('HC Queen bigger than HC Six', () {
      final hc6 = HighCardFigure(
          [CardModel(cardFace: CardFace.Six, cardSuit: CardSuit.Hearts)]);
      final hcQueen = HighCardFigure(
          [CardModel(cardFace: CardFace.Queen, cardSuit: CardSuit.Hearts)]);

      expect(hcQueen.compareTo(hc6), 1);
    });

    test('HC Two equal to HC two', () {
      final hcTwo1 = HighCardFigure(
          [CardModel(cardFace: CardFace.Two, cardSuit: CardSuit.Hearts)]);
      final hcTwo2 = HighCardFigure(
          [CardModel(cardFace: CardFace.Two, cardSuit: CardSuit.Hearts)]);

      expect(hcTwo1.compareTo(hcTwo2), 0);
    });
  });
}
