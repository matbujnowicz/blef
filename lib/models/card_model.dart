import 'package:flutter/material.dart';
import 'package:blef/models/card_hero.dart';

import 'card_color.dart';

class CardModel {
  final CardColor cardColor;
  final CardHero cardHero;

  CardModel({
    @required this.cardColor,
    @required this.cardHero,
  });
}
