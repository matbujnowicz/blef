import 'package:blef/logic/figures/four_of_kind_figure.dart';
import 'package:blef/logic/figures/full_house_figure.dart';
import 'package:blef/logic/figures/two_pairs_figure.dart';
import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/logic/models/hand/hand_model.dart';
import 'package:test/test.dart';

final handOne = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Two),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
]);

final handTwo = HandModel([
  CardModel(cardSuit: CardSuit.Clubs, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Diamonds, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.Jack),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Hearts, cardFace: CardFace.King),
  CardModel(cardSuit: CardSuit.Spades, cardFace: CardFace.Ten),
]);

void main() {
  group('four of kind tests', () {
    test('4 Kings present in hand one', () {
      final figure = FourOfKindFigure(CardFace.King);

      expect(figure.findFigureInHand(handOne), true);
    });

    test('4 Kings not present in hand two', () {
      final figure = FourOfKindFigure(CardFace.King);

      expect(figure.findFigureInHand(handTwo), false);
    });

    test('4 Jacks present in hand two', () {
      final figure = FourOfKindFigure(CardFace.Jack);

      expect(figure.findFigureInHand(handTwo), true);
    });

    test('4 Jacks not present in hand one', () {
      final figure = FourOfKindFigure(CardFace.Jack);

      expect(figure.findFigureInHand(handOne), false);
    });

    test('4 Tens value test', () {
      final figure = FourOfKindFigure(CardFace.Ten);

      expect(figure.figureValue(), 8010);
    });

    test('4 queens higher than 4 twos', () {
      final fig1 = FourOfKindFigure(CardFace.Queen);
      final fig2 = FourOfKindFigure(CardFace.Two);

      expect(fig1.compareTo(fig2), 1);
    });

    test('4 fives equals 4 fives', () {
      final fig1 = FourOfKindFigure(CardFace.Five);
      final fig2 = FourOfKindFigure(CardFace.Five);

      expect(fig1.compareTo(fig2), 0);
    });

    test('4 twos higher FH ACE/KING', () {
      final fig1 = FourOfKindFigure(CardFace.Queen);
      final fig2 = FullHouseFigure(CardFace.Ace, CardFace.King);

      expect(fig1.compareTo(fig2), 1);
    });
  });
}
