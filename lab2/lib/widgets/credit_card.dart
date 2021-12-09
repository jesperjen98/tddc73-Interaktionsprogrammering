import 'dart:ui';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2/constants.dart';

import 'application.dart';

class CreditCard extends StatefulWidget {
  final TextEditingController cardNumberController;
  final TextEditingController cardNameController;
  final TextEditingController cardCvvController;
  final DropDownController cardMonthController;
  final DropDownController cardYearController;
  final FlipCardController cardFlipController;

  const CreditCard(
      {Key? key,
      this.cardHeight = 300,
      required this.cardNumberController,
      required this.cardNameController,
      required this.cardMonthController,
      required this.cardYearController,
      required this.cardCvvController,
      required this.cardFlipController})
      : super(key: key);
  final double cardHeight;

  @override
  CreditCardState createState() {
    return CreditCardState();
  }
}

class CreditCardState extends State<CreditCard> {
  String cardNumber = Const.tempCardNumber;
  String cardName = Const.tempCardName;
  String cardMonth = Const.tempCardMonth;
  String cardYear = Const.tempCardYear;
  String cardCvv = Const.tempCardCvv;
  AssetImage cardImage = const AssetImage("lib/images/visa.png");

  @override
  void initState() {
    super.initState();
    widget.cardNumberController.addListener(updateCardNumber);
    widget.cardNumberController.addListener(updateCardCompany);
    widget.cardNameController.addListener(updateCardName);

    widget.cardCvvController.addListener(updateCardCVV);
    widget.cardMonthController.updateValue = updateCardMonth;
    widget.cardYearController.updateValue = updateCardYear;
  }

  void updateCardNumber() {
    setState(() {
      cardNumber = widget.cardNumberController.text +
          Const.tempCardNumber.substring(
              widget.cardNumberController.text.length,
              Const.tempCardNumber.length);
    });
  }

  void updateCardName() {
    setState(() {
      cardName = widget.cardNameController.text.toUpperCase();
    });
  }

  void updateCardMonth(String newMonth) {
    setState(() {
      cardMonth = newMonth;
    });
  }

  void updateCardYear(String newYear) {
    setState(() {
      cardYear = newYear;
    });
  }

  void updateCardCVV() {
    setState(() {
      cardCvv = widget.cardCvvController.text;
    });
  }

  void updateCardCompany() {
    setState(() {
      for (var key in Const.cardCompanies.keys) {
        if (RegExp(Const.cardCompanies[key]).hasMatch(cardNumber)) {
          cardImage = AssetImage("lib/images/$key.png");
          break;
        }
      }
    });
  }

  @override
  void dispose() {
    widget.cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      flipOnTouch: false,
      controller: widget.cardFlipController,
      fill: Fill.fillBack,
      back: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage("lib/images/17.jpeg"),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                //offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 40,
                color: Colors.black87,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child:
                    Text("CVV", style: Theme.of(context).textTheme.subtitle2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  color: Colors.white,
                  height: 40,
                  child: Text(cardCvv),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Image(
                  width: 50,
                  height: 40,
                  image: cardImage,
                ),
              )
            ],
          )),
      front: Container(
        width: 675 * 0.45,
        height: 435 * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage("lib/images/17.jpeg"),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              //offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.all(Const.cardPadding),
                child: Image(
                  width: 50,
                  height: 40,
                  image: AssetImage("lib/images/chip.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Const.cardPadding),
                child: Image(
                  width: 50,
                  height: 40,
                  image: cardImage,
                ),
              ),
            ]),
            Text(
              cardNumber,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Courier",
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: Const.cardPadding,
                      bottom: Const.cardPadding,
                      top: Const.cardPadding),
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    height: 40,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Card Holder",
                              style: Theme.of(context).textTheme.headline2),
                          Text(cardName,
                              style: Theme.of(context).textTheme.subtitle2),
                        ]),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(
                    right: Const.cardPadding,
                    bottom: Const.cardPadding,
                    top: Const.cardPadding),
                child: Container(
                  width: 60,
                  height: 40,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Expires",
                            style: Theme.of(context).textTheme.headline2),
                        Text(cardMonth + "/" + cardYear.substring(2, 4),
                            style: Theme.of(context).textTheme.subtitle2),
                      ]),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
