// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:lab2/widgets/application.dart';
import 'package:lab2/widgets/credit_card/credit_card.dart';
import 'package:lab2/widgets/credit_card_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        textTheme: const TextTheme(
            headline2: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.normal),
            subtitle2: TextStyle(color: Colors.white, fontSize: 15)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.blue,
                Colors.deepPurpleAccent,
              ],
            )),
            child: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Application(),
              ),
            )),
      ),
    );
  }
}
