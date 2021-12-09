import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

import 'credit_card.dart';
import 'credit_card_form.dart';

class DropDownController {
  late void Function(String) updateValue;
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ApplicationState createState() {
    return ApplicationState();
  }
}

class ApplicationState extends State<Application> {
  final cardNumberController = TextEditingController();
  final cardNameController = TextEditingController();
  final cardMonthController = DropDownController();
  final cardCvvController = TextEditingController();
  final cardYearController = DropDownController();
  final cardFlipController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: CreditCardForm(
          cardNumberController: cardNumberController,
          cardNameController: cardNameController,
          cardMonthController: cardMonthController,
          cardYearController: cardYearController,
          cardCvvController: cardCvvController,
          cardFlipController: cardFlipController,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25),
        child: CreditCard(
          cardNumberController: cardNumberController,
          cardNameController: cardNameController,
          cardMonthController: cardMonthController,
          cardYearController: cardYearController,
          cardCvvController: cardCvvController,
          cardFlipController: cardFlipController,
        ),
      ),
    ]);
  }
}
