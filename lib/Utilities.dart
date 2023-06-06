
import 'package:flutter/cupertino.dart';
class Utilities {
  static List<String> data=["$products"];
  // static dynamic productdetail = "sno";
  // static List<Product> getWidgets(BuildContext context) {
  //   List<Product> product = [];
  //   int n = products.length;
  //   print(n);
  //
  //   for (int i = 0; i <= n - 1; i++) {
  //     var sno = products[i]["sno"];
  //     var name = products[i]["name"];
  //
  //     Row(children: [Text("productno:- ${products[i]["sno"]}")]);
  //     Row(children: [Text("productname:- ${products[i]["name"]}")]);}
  //
  //   return product;
  // }
  //
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