import 'package:flutter/material.dart';


class ShowGrid extends StatefulWidget {
  const ShowGrid({Key? key}) : super(key: key);

  @override
  State<ShowGrid> createState() => _ShowGridState();

}

class _ShowGridState extends State<ShowGrid> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(10, (index){
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        );
      }),
    );
  }
}
