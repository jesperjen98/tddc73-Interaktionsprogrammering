// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.red,
          selectionHandleColor: Colors.red,
          cursorColor: Colors.red,
        ),
        inputDecorationTheme: const InputDecorationTheme(

            focusedBorder: UnderlineInputBorder(

              borderSide: BorderSide(
                  color: Colors.red,

              ),
            )

        ),
    textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          )
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
        ),

      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              child:  Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                TextButton(onPressed: null, child: Text('Button')),
                TextButton(onPressed: null, child: Text('Button'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                TextButton(onPressed: null, child: Text('Button')),
                TextButton(onPressed: null, child: Text('Button'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left:20),
                  child: Text("Email"),
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 40,right: 100),
                        child: TextField()
                    )
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}