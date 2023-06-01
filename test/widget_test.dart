// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_test/flutter_test.dart';
// //
// // import 'package:piano/main.dart';
// //
// // void main() {
// //   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
// //     // Build our app and trigger a frame.
// //     await tester.pumpWidget(const Piano());
// //
// //     // Verify that our counter starts at 0.
// //     expect(find.text('0'), findsOneWidget);
// //     expect(find.text('1'), findsNothing);
// //
// //     // Tap the '+' icon and trigger a frame.
// //     await tester.tap(find.byIcon(Icons.add));
// //     await tester.pump();
// //
// //     // Verify that our counter has incremented.
// //     expect(find.text('0'), findsNothing);
// //     expect(find.text('1'), findsOneWidget);
// //   });
// // }
//
// Stack(
// children: [
//
// Row(
// children:  [
// RichText(
// text: TextSpan(
// style: DefaultTextStyle.of(context).style,
// children: const <TextSpan>[
// TextSpan(text: 'Created by', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),
// TextSpan(text: ' Shubham Mourya',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 30,color: Colors.cyan)),
// ],
// ),
// ),
// ]
// ),
//
// Row(
// mainAxisAlignment: MainAxisAlignment.end,
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Expanded(
// child: SizedBox(
// height: 250,
// child: ElevatedButton(
// style:
// ElevatedButton.styleFrom(backgroundColor: Colors.black),
// onPressed: () {
// setState(
// () {
// _makeDiscs();
// // await Future.delayed(Duration(seconds: 2));
// //_makeDiscs();
// },
// );
// final player = AudioPlayer();
// player.play(AssetSource('note1.wav'));
// print("Play");
// },
// child: const Text(
// "",
// style: TextStyle(color: Colors.teal, fontSize: 20),
// ),
// ),
// )),
// Expanded(
// child: SizedBox(
// height: 250,
// child: ElevatedButton(
// style:
// ElevatedButton.styleFrom(backgroundColor: Colors.white),
// onPressed: () {
// setState(() {
// _makeDiscs();
// });
// print("Play");
// final player = AudioPlayer();
// player.play(AssetSource('note2.wav'));
// },
// child: const Text(
// "",
// style: TextStyle(color: Colors.teal, fontSize: 20),
// ),
// ),
// ),
// ),
// Expanded(
// child: SizedBox(
// height: 250,
// child: ElevatedButton(
// style:
// ElevatedButton.styleFrom(backgroundColor: Colors.black),
// onPressed: () {
// setState(() {
// _makeDiscs();
// });
// print("Play");
// final player = AudioPlayer();
// player.play(AssetSource('note3.wav'));
// },
// child: const Text(
// "",
// style: TextStyle(color: Colors.teal, fontSize: 20),
// ),
// ),
// ),
// ),
// Expanded(
// child: SizedBox(
// height: 250,
// child: ElevatedButton(
// style:
// ElevatedButton.styleFrom(backgroundColor: Colors.white),
// onPressed: () {
// setState(() {
// _makeDiscs();
// });
// print("Play");
// final player = AudioPlayer();
// player.play(AssetSource('note4.wav'));
// },
// child: const Text(
// "",
// style: TextStyle(color: Colors.teal, fontSize: 20),
// ),
// ),
// )),
// Expanded(
// child: SizedBox(
// height: 250,
// child: ElevatedButton(
// style:
// ElevatedButton.styleFrom(backgroundColor: Colors.black),
// onPressed: () {
// setState(() {
// _makeDiscs();
// });
// print("Play");
// final player = AudioPlayer();
// player.play(AssetSource('note5.wav'));
// },
// child: const Text(
// "",
// style: TextStyle(color: Colors.teal, fontSize: 20),
// ),
// ),
// )),
// Expanded(
// child: SizedBox(
// height: 250,
// child: ElevatedButton(
// style:
// ElevatedButton.styleFrom(backgroundColor: Colors.white),
// onPressed: () {
// setState(() {
// _makeDiscs();
// });
// print("Play");
// final player = AudioPlayer();
// player.play(AssetSource('note6.wav'));
// },
// child: const Text(
// "",
// style: TextStyle(color: Colors.teal, fontSize: 20),
// ),
// ),
// )),
// Expanded(
// child: SizedBox(
// height: 250,
// child: ElevatedButton(
// style:
// ElevatedButton.styleFrom(backgroundColor: Colors.black),
// onPressed: () {
// setState(() {
// _makeDiscs();
// });
// print("Play");
// final player = AudioPlayer();
// player.play(AssetSource('note7.wav'));
// },
// child: const Text(
// "",
// style: TextStyle(color: Colors.teal, fontSize: 20),
// ),
// ),
// ))
// ],
// ),
//
// GestureDetector(
// onTap: () => setState(() {
// _makeDiscs();
// }),
// child: Stack(
// children: [
// for (final disc in _discs)
// Positioned.fill(
// child: AnimatedAlign(
// duration: const Duration(milliseconds: 500),
// curve: Curves.easeInOut,
// alignment: disc.alignment,
// child: AnimatedContainer(
// duration: const Duration(milliseconds: 500),
// decoration: BoxDecoration(
// color: disc.color,
// shape: BoxShape.circle,
// ),
// height: disc.size,
// width: disc.size,
// ),
// ),
// ),
// ],
// ),
// ),
// ],
// );
