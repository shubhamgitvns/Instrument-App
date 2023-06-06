import 'package:flutter/material.dart';
import 'package:piano/stateful.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "simple",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My app"),
          centerTitle: true,
        ),
        body: ShowGrid(),
      ),
    );
  }
}
