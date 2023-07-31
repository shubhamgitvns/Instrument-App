import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'main.dart';

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
    return Container(
      color: const Color(0xFFF1000),
      child: SizedBox.expand(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(

                  height: 300,
                  child: Stack(
                    children: [
                      //************Text span
                      // Center(
                      //   child: RichText(
                      //     text: TextSpan(
                      //       style: DefaultTextStyle.of(context).style,
                      //
                      //       // children: const <TextSpan>[
                      //       //   TextSpan(
                      //       //       text: 'Created by',
                      //       //       style: TextStyle(
                      //       //           fontWeight: FontWeight.bold,
                      //       //           fontSize: 20,
                      //       //           color: Colors.black)),
                      //       //   TextSpan(
                      //       //       text: ' Shubham Mourya',
                      //       //       style: TextStyle(
                      //       //           fontWeight: FontWeight.bold,
                      //       //           fontStyle: FontStyle.italic,
                      //       //           fontSize: 30,
                      //       //           color: Colors.cyan)),
                      //       // ],
                      //
                      //
                      //
                      //     ),
                      //   ),
                      // ),
                      //Text span   *********************
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
            ]),
      ),
    );
  }
}

class DrumPage extends StatefulWidget {
  const DrumPage({super.key});

  @override
  State<DrumPage> createState() => _DrumPageState();
}

class _DrumPageState extends State<DrumPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

