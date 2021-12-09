import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'application.dart';
import 'dropdown.dart';

//Using the credit card number formatter implemented in:
//https://medium.com/flutter-community/
//validating-and-formatting-payment-card-text-fields-in-flutter-bebe12bc9c60
//----------------------------------------------------------------------------
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
//----------------------------------------------------------------------------

class CreditCardForm extends StatefulWidget {
  final TextEditingController cardNumberController;
  final TextEditingController cardNameController;
  final TextEditingController cardCvvController;
  final DropDownController cardMonthController;
  final DropDownController cardYearController;
  final FlipCardController cardFlipController;

  const CreditCardForm(
      {Key? key,
      required this.cardNumberController,
      required this.cardNameController,
      required this.cardMonthController,
      required this.cardYearController,
      required this.cardCvvController,
      required this.cardFlipController})
      : super(key: key);

  @override
  CreditCardFormState createState() {
    return CreditCardFormState();
  }
}

class CreditCardFormState extends State<CreditCardForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.cardNumberController.dispose();
    widget.cardNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 15,
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 120),
            const Text("Card Number"),
            const SizedBox(height: 5),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberInputFormatter()
              ],
              controller: widget.cardNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Card Name"),
            const SizedBox(height: 5),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Zåäö ]")),
                LengthLimitingTextInputFormatter(18)
              ],
              controller: widget.cardNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text("Expiration Date"),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomDropdown(
                            items: Const.expirationDate,
                            dropDownController: widget.cardMonthController,
                          ),
                        ]),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomDropdown(
                      items: Const.expirationYear,
                      dropDownController: widget.cardYearController,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        const Text("CVV"),
                        const SizedBox(
                          height: 5,
                        ),
                        Focus(
                          onFocusChange: (hasFocus) {
                            widget.cardFlipController.toggleCard();
                          },
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4)
                            ],
                            controller: widget.cardCvvController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ])),
                ]),
          ],
        ),
      ),
    );
  }
}
