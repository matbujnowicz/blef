import 'package:blef/logic/models/card/card_model.dart';
import 'package:blef/utils/fonts.dart';
import 'package:blef/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  final CardModel cardModel;

  const CardWidget(this.cardModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 50,
      height: 100,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _textForFace(),
              style: normalFont(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(left: 0.5),
              child: _iconForSuit(context),
            ),
          ]),
      decoration: BoxDecoration(
          color: Style.colors.background,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                2.0, // horizontal, move right 10
                2.0, // vertical, move down 10
              ),
            )
          ]),
    );
  }

  Widget _iconForSuit(BuildContext context) {
    switch (cardModel.cardSuit) {
      case CardSuit.Spades:
        return SvgPicture.asset(
          Style.svgAssets.spades,
          height: 10,
          width: 10,
        );
      case CardSuit.Hearts:
        return SvgPicture.asset(
          Style.svgAssets.hearts,
          height: 10,
          width: 10,
        );
      case CardSuit.Diamonds:
        return SvgPicture.asset(
          Style.svgAssets.diamonds,
          height: 10,
          width: 10,
        );
      case CardSuit.Clubs:
        return SvgPicture.asset(
          Style.svgAssets.clubs,
          height: 10,
          width: 10,
        );
      default:
        throw Exception("No suit icon found for given CardSuit");
    }
  }

  String _textForFace() {
    if (cardModel.faceValue <= 10) return cardModel.faceValue.toString();
    final indexOfDot = cardModel.cardFace.toString().indexOf(".");
    return cardModel.cardFace
        .toString()
        .substring(indexOfDot + 1, indexOfDot + 2);
  }
}
