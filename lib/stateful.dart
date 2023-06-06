import 'package:flutter/material.dart';
import 'package:piano/Utilities.dart';

class ShowGrid extends StatefulWidget {
  const ShowGrid({Key? key}) : super(key: key);

  @override
  State<ShowGrid> createState() => _ShowGridState();
}

class _ShowGridState extends State<ShowGrid> {
  List<String> data = Utilities.getWidgets();

  @override
  Widget build(BuildContext context) {
    // List<String> data=Utilities.data;

    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        data.length,
        (index) {
          return Center(
            child: Text(
              ' ${data[index]}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        },
      ),
    );
  }
}
