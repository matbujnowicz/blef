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
      final highCardAce = HighCardFigure(CardFace.Ace);

      expect(highCardAce.findFigureInHand(handOne), true);
    });

    test('HC King not present in  hand one', () {
      final highCardKing = HighCardFigure(CardFace.King);

      expect(highCardKing.findFigureInHand(handOne), false);
    });

    test('HC Ace not present in  hand two', () {
      final highCardAce = HighCardFigure(CardFace.Ace);

      expect(highCardAce.findFigureInHand(handTwo), false);
    });

    test('HC King present in  hand two', () {
      final highCardKing = HighCardFigure(CardFace.King);

      expect(highCardKing.findFigureInHand(handTwo), true);
    });

    test('HC Jack value test', () {
      final highCardKing = HighCardFigure(CardFace.Jack);

      expect(highCardKing.figureValue(), 1011);
    });

    test('HC Jack higher than HC 10', () {
      final highCardJack = HighCardFigure(CardFace.Jack);
      final highCardTen = HighCardFigure(CardFace.Ten);

      expect(highCardJack.compareTo(highCardTen), 1);
    });

    test('HC 10 smaller than HC Jack', () {
      final highCardJack = HighCardFigure(CardFace.Jack);
      final highCardTen = HighCardFigure(CardFace.Ten);

      expect(highCardTen.compareTo(highCardJack), -1);
    });

    test('HC six smaller than HC Queen', () {
      final hc6 = HighCardFigure(CardFace.Six);
      final hcQueen = HighCardFigure(CardFace.Queen);

      expect(hc6.compareTo(hcQueen), -1);
    });

    test('HC Queen bigger than HC Six', () {
      final hc6 = HighCardFigure(CardFace.Six);
      final hcQueen = HighCardFigure(CardFace.Queen);

      expect(hcQueen.compareTo(hc6), 1);
    });

    test('HC Two equal to HC two', () {
      final hcTwo1 = HighCardFigure(CardFace.Two);
      final hcTwo2 = HighCardFigure(CardFace.Two);

      expect(hcTwo1.compareTo(hcTwo2), 0);
    });
  });
}
