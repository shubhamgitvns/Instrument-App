import 'package:flutter/material.dart';

void main() {
  runApp(const Piano());
}

class Piano extends StatelessWidget {
  const Piano({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text("Piano"),
          centerTitle: true,
        ),
      ),
    );
  }
}
