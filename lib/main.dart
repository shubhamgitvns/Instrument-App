import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; //import library to play audio

void main() {
  runApp(const Piano());
}

class Piano extends StatelessWidget {
  const Piano({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text("Piano"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ElevatedButton(
                        style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                        onPressed: () {
                          print("Play");
                          final player = AudioPlayer();
                          player.play(AssetSource('note1.wav'));
                        },
                        child: const Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                ),

                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        print("Play");
                        final player = AudioPlayer();
                        player.play(AssetSource('note2.wav'));
                      },
                      child: const Text(
                        "2",
                        style: TextStyle(color: Colors.teal, fontSize: 20),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {
                        print("Play");
                        final player = AudioPlayer();
                        player.play(AssetSource('note3.wav'));
                      },
                      child: const Text(
                        "3",
                        style: TextStyle(color: Colors.teal, fontSize: 20),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                      onPressed: () {
                        print("Play");
                        final player = AudioPlayer();
                        player.play(AssetSource('note4.wav'));
                      },
                      child: const Text(
                        "4",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        print("Play");
                        final player = AudioPlayer();
                        player.play(AssetSource('note5.wav'));
                      },
                      child: const Text(
                        "5",
                        style: TextStyle(color: Colors.teal, fontSize: 20),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: () {
                        print("Play");
                        final player = AudioPlayer();
                        player.play(AssetSource('note6.wav'));
                      },
                      child: const Text(
                        "6",
                        style: TextStyle(color: Colors.teal, fontSize: 20),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                      onPressed: () {
                        print("Play");
                        final player = AudioPlayer();
                        player.play(AssetSource('note7.wav'));
                      },
                      child: const Text(
                        "7",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),



          ],
        ),
      ),
    );
  }
}
