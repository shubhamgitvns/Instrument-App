import 'package:flutter/material.dart';
import 'Utilities.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Column(children: Utilities.getWidgets(context));
  }
}
