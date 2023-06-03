import 'package:flutter/material.dart';
import 'package:piano/stateful.dart';

class ProductPage extends StatelessWidget {
  void transfer() {}
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Product page"),
        ),
        body: const Products(),
      ),
    );
  }
}
