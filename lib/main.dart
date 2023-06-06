
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:piano/stateless.dart';

import 'Utilities.dart';
Future<void> main() async {
  Utilities.products = await Downloader.download(
      "gist.githubusercontent.com", //Site name
      // Site link
      "/shubhamgitvns/3935c8fe5f8899d7f4c5bb7a8bc9a175/raw/ce3963e0bd74b9010d8d5271456d41c6aa522456/array.json");
  var productsarray = Utilities.products["array"];
  print(productsarray);
  String sno;
  sno=(productsarray[0]["sno"]);
  print(sno);
  print(Utilities.products["array"][0]["name"]);
  Utilities.products = productsarray;

  runApp(const MyApp());
}


class Downloader{
  static Future download(String site, String link) async {
    // final url = Uri.https("gist.githubusercontent.com", link, {});
    final url = Uri.https(site, link, {});
    try {
      final response = await http.get(url);
      print("Status ${response.statusCode}");
      final jsonResponse = convert.jsonDecode(response.body);
      //print(jsonResponse);

      return jsonResponse;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
