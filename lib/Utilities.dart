
import 'package:flutter/cupertino.dart';
class Utilities {
  static dynamic productdetail = "";

  static List<String> getWidgets() {
    List<String> widget = [];
    int n = products.length;
    print(n);

    for (int i = 0; i <= n - 1; i++) {
      var sno = products[i]["sno"];
      var name = products[i]["name"];
      var Class = products[i]["class"];

      widget.add("Sno:-$sno ");
      widget.add("Name:-$name");
      widget.add("Class:-$Class");
      // Row(children: [Text("productname:- ${products[i]["name"]}")]);}
    }
      return widget;

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