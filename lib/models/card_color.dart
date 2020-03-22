enum ColorSymbol {
  Wino,
  Serce,
  Dzwonek,
  Trefl,
}

class CardColor {
  final int value;
  final ColorSymbol colorSymbol;

  CardColor(this.colorSymbol) : value = valueForSymol(colorSymbol);

  static int valueForSymol(ColorSymbol symbol) {
    switch (symbol) {
      case ColorSymbol.Wino:
        return 3;
      case ColorSymbol.Serce:
        return 2;
      case ColorSymbol.Dzwonek:
        return 1;
      case ColorSymbol.Trefl:
        return 0;
      default:
        return -1;
    }
  }
}
