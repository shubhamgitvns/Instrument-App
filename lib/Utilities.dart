
import 'package:flutter/cupertino.dart';
class Utilities {
  static List<Widget> getWidgets(BuildContext context) {
    List<Widget> widgets = [];
    int n = products.length;
    print(n);
    for (int i = 0; i <= n - 1; i++) {
      var sno = products[i]["sno"];
      var name = products[i]["name"];
      widgets.add(
          Row(children: [
            Text("Sno:- ${products[i]["sno"]}")]));
      widgets.add(
          Row(children: [
            Text("Name:- ${products[i]["name"]}"),
          ]));
    }
    return widgets;
  }

  static dynamic products = "";
}

class Product {
  String sno;
  String name;

  Product(this.sno, this.name);

  @override
  String toString() {
    return 'Product{product: $sno,name:$name}';
  }
}