import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'Utilities.dart';

void main() async {
  Utilities.products = await Downloader.download(
      "gist.githubusercontent.com", //Site name
      // Site link
      "/shubhamgitvns/3935c8fe5f8899d7f4c5bb7a8bc9a175/raw/ce3963e0bd74b9010d8d5271456d41c6aa522456/array.json");
  var productsarray = Utilities.products["array"];
  print(productsarray);
  Utilities.products = productsarray;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<String> data = ["One", "Two", "Three", "Four", "Five"];

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),

        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(data.length, (index) {
            return Center(
              child: Text(
                'Item ${data[index]}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }
          ),
        ),
      ),
    );
  }
}


class Downloader {
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