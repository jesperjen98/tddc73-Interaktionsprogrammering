// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:lab2/widgets/application.dart';

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
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.normal),
            subtitle2: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Courier",
            )),
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
