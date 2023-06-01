
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; //import library to play audio

class DiscData {
  static final _rng = Random();

  final double size;
  final Color color;
  final Alignment alignment;

  DiscData()
      : size = _rng.nextDouble() * 40 + 10,
        color = Color.fromARGB(
          _rng.nextInt(200),
          _rng.nextInt(255),
          _rng.nextInt(255),
          _rng.nextInt(255),
        ),
        alignment = Alignment(
          _rng.nextDouble() * 2 - 1,
          _rng.nextDouble() * 2 - 1,
        );
}

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: const Color(0xFF15202D),
          child: const SizedBox.expand(
            child: VariousDiscs(50),
          ),
        ),
      ),
    ),
  );
}

class VariousDiscs extends StatefulWidget {
  final int numberOfDiscs;

  const VariousDiscs(this.numberOfDiscs);

  @override
  State<VariousDiscs> createState() => _VariousDiscsState();
}

class _VariousDiscsState extends State<VariousDiscs> {
  final _discs = <DiscData>[];

  @override
  void initState() {
    super.initState();
    _makeDiscs();
  }

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }
double buttonheight=150;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Expanded(
        child: SizedBox(

          height: 300,
          child: Stack(
            children: [

              Center(
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Created by',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                      TextSpan(
                          text: ' Shubham Mourya',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 30,
                              color: Colors.cyan)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _makeDiscs();
                }),
                child: Stack(children: [
                  for (final disc in _discs)
                    Positioned.fill(
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        alignment: disc.alignment,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: disc.color,
                            shape: BoxShape.circle,
                          ),
                          height: disc.size,
                          width: disc.size,
                        ),
                      ),
                    ),
                ]),
              ),
            ],
          ),
        ),
      ),
      Column(
        children: [
          Row(
            children: [
              Expanded(

                child: SizedBox(
                  height: buttonheight,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      setState(
                        () {
                          _makeDiscs();
                        },
                      );
                      final player = AudioPlayer();
                      player.play(AssetSource('note1.wav'));
                      print("Play");
                    },
                    child: const Text(
                      "",
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: buttonheight,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      setState(
                        () {
                          _makeDiscs();
                          // await Future.delayed(Duration(seconds: 2));
                          //_makeDiscs();
                        },
                      );
                      final player = AudioPlayer();
                      player.play(AssetSource('note2.wav'));

                      print("Play");
                    },
                    child: const Text(
                      "",
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: buttonheight,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      setState(
                        () {
                          _makeDiscs();
                          // await Future.delayed(Duration(seconds: 2));
                          //_makeDiscs();
                        },
                      );
                      final player = AudioPlayer();
                      player.play(AssetSource('note3.wav'));

                      print("Play");
                    },
                    child: const Text(
                      "",
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: buttonheight,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      setState(
                        () {
                          _makeDiscs();
                          // await Future.delayed(Duration(seconds: 2));
                          //_makeDiscs();
                        },
                      );
                      final player = AudioPlayer();
                      player.play(AssetSource('note4.wav'));

                      print("Play");
                    },
                    child: const Text(
                      "",
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: buttonheight,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      setState(
                        () {
                          _makeDiscs();
                          // await Future.delayed(Duration(seconds: 2));
                          //_makeDiscs();
                        },
                      );
                      final player = AudioPlayer();
                      player.play(AssetSource('note5.wav'));

                      print("Play");
                    },
                    child: const Text(
                      "",
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: buttonheight,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      setState(
                        () {
                          _makeDiscs();
                          // await Future.delayed(Duration(seconds: 2));
                          //_makeDiscs();
                        },
                      );
                      final player = AudioPlayer();
                      player.play(AssetSource('note6.wav'));

                      print("Play");
                    },
                    child: const Text(
                      "",
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: buttonheight,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      setState(
                        () {
                          _makeDiscs();
                          // await Future.delayed(Duration(seconds: 2));
                          //_makeDiscs();
                        },
                      );
                      final player = AudioPlayer();
                      player.play(AssetSource('note7.wav'));

                      print("Play");
                    },
                    child: const Text(
                      "",
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )
    ]);
  }
}
