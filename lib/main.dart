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
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Piano by shubham"),
          centerTitle: true,
        ),
        body: Container(

           color: const Color(0xddd5000),
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

  void _makeDiscs() async {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
    await Future.delayed(const Duration(seconds: 2));
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children:  [

    RichText(
    text: TextSpan(

      style: DefaultTextStyle.of(context).style,
      children: const <TextSpan>[
        TextSpan(text: 'Created by', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),
        TextSpan(text: ' Shubham Mourya',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 30,color: Colors.cyan)),


          ],
        ),
    ),
        ]
        ),
        Center(
          child: Row(
            children: [
              Expanded(
                  child: SizedBox(
                height: 250,
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
                    player.play(AssetSource('note1.wav'));

                    print("Play");
                  },
                  child: const Text(
                    "",
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: 250,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    setState(() {
                      _makeDiscs();
                    });
                    print("Play");
                    final player = AudioPlayer();
                    player.play(AssetSource('note2.wav'));
                  },
                  child: const Text(
                    "",
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: 250,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    setState(() {
                      _makeDiscs();
                    });
                    print("Play");
                    final player = AudioPlayer();
                    player.play(AssetSource('note3.wav'));
                  },
                  child: const Text(
                    "",
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: 250,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    setState(() {
                      _makeDiscs();
                    });
                    print("Play");
                    final player = AudioPlayer();
                    player.play(AssetSource('note4.wav'));
                  },
                  child: const Text(
                    "",
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: 250,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    setState(() {
                      _makeDiscs();
                    });
                    print("Play");
                    final player = AudioPlayer();
                    player.play(AssetSource('note5.wav'));
                  },
                  child: const Text(
                    "",
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: 250,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    setState(() {
                      _makeDiscs();
                    });
                    print("Play");
                    final player = AudioPlayer();
                    player.play(AssetSource('note6.wav'));
                  },
                  child: const Text(
                    "",
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
              )),
              Expanded(
                  child: SizedBox(
                height: 250,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    setState(() {
                      _makeDiscs();
                    });
                    print("Play");
                    final player = AudioPlayer();
                    player.play(AssetSource('note7.wav'));
                  },
                  child: const Text(
                    "",
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
              ))
            ],
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            _makeDiscs();
          }),
          child: Stack(
            children: [
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
            ],
          ),
        ),
      ],
    );
  }
}
