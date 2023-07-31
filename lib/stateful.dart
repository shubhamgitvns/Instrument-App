import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'main.dart';
//************Piano Page**************************//
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

//********************Drum Page**************************//

class DrumPage extends StatefulWidget {
  final int numberOfDiscs;
  const DrumPage(this.numberOfDiscs);

  @override
  State<DrumPage> createState() => _DrumPageState();
}

class _DrumPageState extends State<DrumPage> {
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
      color: const Color(0xFF78909C),
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
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Customcontainer(context),
                     Secondbutton(context),
                     Thirdbutton(context),

                   ],
                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Secondbutton(context),
                      Thirdbutton(context),
                      Customcontainer(context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Thirdbutton(context),
                      Customcontainer(context),
                      Secondbutton(context),
                    ],
                  )
                ],
              )
            ]),
      ),
    );
  }

  Customcontainer(BuildContext context){
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
        width: 70,
        decoration: const BoxDecoration(
          //color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0,
              spreadRadius: 0.0,
            )
          ],

        ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              padding: const EdgeInsets.symmetric(
                  horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("",style: TextStyle(fontSize: 40),),
            onPressed: (){
              setState(
                    () {
                  _makeDiscs();
                },
              );
              final player = AudioPlayer();
              player.play(AssetSource('note1.wav'));

            },
          ),
    ),
      );
  }

  Secondbutton(BuildContext context){
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            //color: Colors.red,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0,
                spreadRadius: 0.0,
              )
            ],

          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.pink,
              padding: const EdgeInsets.symmetric(
                  horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("",style: TextStyle(fontSize: 40),),
            onPressed: (){

            },
          ),
        ),
      );
  }
  Thirdbutton(BuildContext context){
    return
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(
          //color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.0),
              blurRadius: 10.0,
              spreadRadius: 0.0,
            )
          ],

        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            padding: const EdgeInsets.symmetric(
                horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("",style: TextStyle(fontSize: 40),),
          onPressed: (){

          },
        ),
      ),
    );
  }
}



