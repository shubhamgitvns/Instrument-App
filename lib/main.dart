
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:piano/stateful.dart';
import 'package:piano/stateless.dart';

class DiscData {
  static final _rng = Random();

  final double size;
  final Color color;
  final Alignment alignment;

  DiscData()
      : size = _rng.nextDouble() * 40 + 10,
        color = Color.fromARGB(
          _rng.nextInt(200),
          _rng.nextInt(255),
          _rng.nextInt(255),
          _rng.nextInt(255),
        ),
        alignment = Alignment(
          _rng.nextDouble() * 2 - 1,
          _rng.nextDouble() * 2 - 1,
        );
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/Piano': (context) => const VariousDiscs(50),
      '/Drum': (context) => const DrumPage(50),


    },
  ));
}




