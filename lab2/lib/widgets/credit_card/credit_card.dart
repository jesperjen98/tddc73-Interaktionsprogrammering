import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2/constants.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key, this.cardHeight = 300}) : super(key: key);
  final double cardHeight;

  @override
  CreditCardState createState() {
    return CreditCardState();
  }
}

class CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 675 * 0.45,
      height: 435 * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage("lib/images/14.jpeg"),
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
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.all(Const.cardPadding),
                  child: Image(
                    width: 50,
                    height: 40,
                    image: AssetImage("lib/images/chip.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Const.cardPadding),
                  child: Image(
                    width: 50,
                    height: 40,
                    image: AssetImage("lib/images/visa.png"),
                  ),
                ),
              ]),
          const Text(
            "XXXX XXXX XXXX XXXX",
            style: TextStyle(color: Colors.white, fontSize: 20),
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
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Card Holder",
                            style: Theme.of(context).textTheme.headline2),
                        Text("Jesper Jensen",
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
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Expires",
                          style: Theme.of(context).textTheme.headline2),
                      Text("MM/YY",
                          style: Theme.of(context).textTheme.subtitle2),
                    ]),
              ),
            )
          ])
        ],
      ),
    );
  }
}
