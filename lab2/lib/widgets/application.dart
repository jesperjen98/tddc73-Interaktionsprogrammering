import 'package:flutter/material.dart';

import 'credit_card/credit_card.dart';
import 'credit_card_form.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ApplicationState createState() {
    return ApplicationState();
  }
}

class ApplicationState extends State<Application> {
  final cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [
      Padding(
        padding: EdgeInsets.only(top: 100),
        child: CreditCardForm(),
      ),
      Padding(
        padding: EdgeInsets.only(left: 25),
        child: CreditCard(),
      ),
    ]);
  }
}
