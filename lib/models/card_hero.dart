enum HeroSymbol {
  Ace,
  King,
  Queen,
  Jack,
  Ten,
  Nine,
  Eight,
  Seven,
  Six,
  Five,
  Four,
  Three,
  Two,
}

class CardHero {
  final int value;
  final HeroSymbol heroSymbol;

  CardHero(this.heroSymbol) : value = valueForSymbol(heroSymbol);

  static int valueForSymbol(HeroSymbol heroSymbol) {
    switch (heroSymbol) {
      case HeroSymbol.Ace:
        return 14;
      case HeroSymbol.King:
        return 13;
      case HeroSymbol.Queen:
        return 12;
      case HeroSymbol.Jack:
        return 11;
      case HeroSymbol.Ten:
        return 10;
      case HeroSymbol.Nine:
        return 9;
      case HeroSymbol.Eight:
        return 8;
      case HeroSymbol.Seven:
        return 7;
      case HeroSymbol.Six:
        return 6;
      case HeroSymbol.Five:
        return 5;
      case HeroSymbol.Four:
        return 4;
      case HeroSymbol.Three:
        return 3;
      case HeroSymbol.Two:
        return 2;
      default:
        return -1;
    }
  }
}
