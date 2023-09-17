

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'main.dart';

//************Piano Page**************************//
class VariousDiscs extends StatefulWidget {
  final int numberOfDiscs;

  const VariousDiscs(this.numberOfDiscs);

  @override
  _VariousDiscsState createState() => _VariousDiscsState();
// State<VariousDiscs> createState() => _VariousDiscsState();
}

class _VariousDiscsState extends State<VariousDiscs> {
  final _discs = <DiscData>[];
  bool _isRecording = false;
  //<<<<<<<Elements of audio recorder>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  FlutterSoundRecorder? _audioRecorder;
  FlutterSoundPlayer? _audioPlayer;

  @override
  void initState() {
    super.initState();
    _makeDiscs();
    //<<<<<<<initialization of audio recorder>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    _initializeAudio();
  }
// <<<<<<<<audio initialization function>>>>>>>>>>>>>>>>
  void _initializeAudio() {
    _audioRecorder = FlutterSoundRecorder();
    _audioPlayer = FlutterSoundPlayer();
    _audioPlayer!.openAudioSession();
  }

  @override
  void dispose() {
    _audioRecorder!.closeAudioSession();
    _audioPlayer!.closeAudioSession();
    super.dispose();
  }
  // <<<<<<<<Create the disk>>>>>>>>>>>>>>>>
  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }
// <<<<<<<<Piano button height>>>>>>>>>>>>>>>>
  double buttonheight = 150;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1000),
      child: SizedBox.expand(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // <<<<<<<<Audio recording function calling>>>>>>>>>>>>>>>>
                    _isRecording
                        ? Text('...',style: TextStyle(fontSize: 15,color: Colors.red),)
                        : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(5.0),
                          side: const BorderSide(
                            color: Colors.orange,
                            width: 1.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          primary: Colors.white,
                          //elevation: like a box shadow
                          elevation: 10.0,
                        ),
                        onPressed:
                        // <<<<<<<<Audio recording function calling>>>>>>>>>>>>>>>>
                        _startRecording,
                        child: const Icon(
                          Icons.mic,
                          color: Colors.green,
                        )),
                    SizedBox(width: 10,),// ElevatedButton(
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(5.0),
                          side: const BorderSide(
                            color: Colors.orange,
                            width: 1.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          primary: Colors.white,
                          //elevation: like a box shadow
                          elevation: 10.0,
                        ),
                        onPressed:
                        // <<<<<<<<Audio stop recording function calling>>>>>>>>>>>>>>>>
                        _stopRecording,
                        child: const Icon(
                          Icons.mic_none,
                          color: Colors.red,
                        )),
                    const SizedBox(
                      width: 10,
                    ),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(5.0),
                          side: const BorderSide(
                            color: Colors.orange,
                            width: 1.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          primary: Colors.white,
                          //elevation: like a box shadow
                          elevation: 10.0,
                        ),
                        onPressed:
                        // <<<<<<<<Audio  play recording function calling>>>>>>>>>>>>>>>>
                        _playRecordedAudio,
                        child: const Icon(
                          Icons.headphones,
                          color: Colors.blue,
                        )), // ElevatedButton(
                  ],
                ),
              ),
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
              // <<<<<<<<Piano buttons column start>>>>>>>>>>>>>>>>
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: buttonheight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
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
                              style:
                              TextStyle(color: Colors.teal, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: buttonheight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
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
                              style:
                              TextStyle(color: Colors.teal, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: buttonheight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
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
                              style:
                              TextStyle(color: Colors.teal, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: buttonheight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
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
                              style:
                              TextStyle(color: Colors.teal, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: buttonheight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
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
                              style:
                              TextStyle(color: Colors.teal, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: buttonheight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
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
                              style:
                              TextStyle(color: Colors.teal, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: buttonheight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
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
                              style:
                              TextStyle(color: Colors.teal, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
              // <<<<<<<<Piano button column end>>>>>>>>>>>>>>>>
            ]),
      ),
    );
  }
  // <<<<<<<<Audio start recording function>>>>>>>>>>>>>>>>
  void _startRecording() async {
    if (await _requestPermission(Permission.microphone)) {
      String filePath = await _getFilePath();
      await _audioRecorder!.openAudioSession();
      await _audioRecorder!.startRecorder(
        toFile: filePath,
        codec: Codec.aacMP4,
      );
      setState(() => _isRecording = true);
    } else {
      print('Permission denied.');
    }
  }
  // <<<<<<<<Audio stop recording function>>>>>>>>>>>>>>>>
  void _stopRecording() async {
    await _audioRecorder!.stopRecorder();
    setState(() => _isRecording = false);
  }

  Future<String> _getFilePath() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = appDir.path + '/recorded_audio.aac';
    return filePath;
  }

  Future<bool> _requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    return status.isGranted;
  }

  void _playRecordedAudio() async {
    String filePath = await _getFilePath();
    await _audioPlayer!.startPlayer(
      fromURI: filePath,
      codec: Codec.aacMP4,
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
  bool _isRecording = false;
  //<<<<<<<Element of audio recorder>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  FlutterSoundRecorder? _audioRecorder;
  FlutterSoundPlayer? _audioPlayer;

  @override
  void initState() {
    super.initState();
    _makeDiscs();
    //<<<<<<<initialization of audio recorder>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    _initializeAudio();
  }
// <<<<<<<<audio initialization function>>>>>>>>>>>>>>>>
  void _initializeAudio() {
    _audioRecorder = FlutterSoundRecorder();
    _audioPlayer = FlutterSoundPlayer();
    _audioPlayer!.openAudioSession();
  }

  @override
  void dispose() {
    _audioRecorder!.closeAudioSession();
    _audioPlayer!.closeAudioSession();
    super.dispose();
  }
  // <<<<<<<<Create the disk>>>>>>>>>>>>>>>>
  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }
  double buttonheight = 150;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF78909C),
      child: SizedBox.expand(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // <<<<<<<<Audio recording function calling>>>>>>>>>>>>>>>>
                    _isRecording
                        ? Text('...',style: TextStyle(fontSize: 15,color: Colors.red),)
                        : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(5.0),
                          side: const BorderSide(
                            color: Colors.orange,
                            width: 1.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          primary: Colors.white,
                          //elevation: like a box shadow
                          elevation: 10.0,
                        ),
                        onPressed:
                        // <<<<<<<<Audio recording function calling>>>>>>>>>>>>>>>>
                        _startRecording,
                        child: const Icon(
                          Icons.mic,
                          color: Colors.green,
                        )),

                    SizedBox(width: 10,),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(5.0),
                          side: const BorderSide(
                            color: Colors.orange,
                            width: 1.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          primary: Colors.white,
                          //elevation: like a box shadow
                          elevation: 10.0,
                        ),
                        onPressed:
                        // <<<<<<<<Audio stop recording function calling>>>>>>>>>>>>>>>>
                        _stopRecording,
                        child: const Icon(
                          Icons.mic_none,
                          color: Colors.red,
                        )),
                    const SizedBox(
                      width: 10,
                    ),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(5.0),
                          side: const BorderSide(
                            color: Colors.orange,
                            width: 1.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          primary: Colors.white,
                          //elevation: like a box shadow
                          elevation: 10.0,
                        ),
                        onPressed:
                        // <<<<<<<<Audio  play recording function calling>>>>>>>>>>>>>>>>
                        _playRecordedAudio,
                        child: const Icon(
                          Icons.headphones,
                          color: Colors.blue,
                        )), // ElevatedButton(
                  ],
                ),
              ),
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

  Customcontainer(BuildContext context) {
    return Padding(
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
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "",
            style: TextStyle(fontSize: 40),
          ),
          onPressed: () {
            setState(
                  () {
                _makeDiscs();
              },
            );
            final player = AudioPlayer();
            player.play(AssetSource('drum1.wav'));
          },
        ),
      ),
    );
  }

  Secondbutton(BuildContext context) {
    return Padding(
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
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "",
            style: TextStyle(fontSize: 40),
          ),
          onPressed: () {
            setState(
                  () {
                _makeDiscs();
              },
            );
            final player = AudioPlayer();
            player.play(AssetSource('Drum2.wav'));
          },
        ),
      ),
    );
  }

  Thirdbutton(BuildContext context) {
    return Padding(
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
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "",
            style: TextStyle(fontSize: 40),
          ),
          onPressed: () {
            setState(
                  () {
                _makeDiscs();
              },
            );
            final player = AudioPlayer();
            player.play(AssetSource('drum3.wav'));
          },
        ),
      ),
    );
  }
  // <<<<<<<<Audio start recording function>>>>>>>>>>>>>>>>
  void _startRecording() async {
    if (await _requestPermission(Permission.microphone)) {
      String filePath = await _getFilePath();
      await _audioRecorder!.openAudioSession();
      await _audioRecorder!.startRecorder(
        toFile: filePath,
        codec: Codec.aacMP4,
      );
      setState(() => _isRecording = true);
    } else {
      print('Permission denied.');
    }
  }
  // <<<<<<<<Audio stop recording function>>>>>>>>>>>>>>>>
  void _stopRecording() async {
    await _audioRecorder!.stopRecorder();
    setState(() => _isRecording = false);
  }

  Future<String> _getFilePath() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = appDir.path + '/recorded_audio.aac';
    return filePath;
  }

  Future<bool> _requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    return status.isGranted;
  }

  void _playRecordedAudio() async {
    String filePath = await _getFilePath();
    await _audioPlayer!.startPlayer(
      fromURI: filePath,
      codec: Codec.aacMP4,
    );
  }


}


// import 'dart:async';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'dart:io';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import 'main.dart';
//
// //************Piano Page**************************//
// class VariousDiscs extends StatefulWidget {
//   final int numberOfDiscs;
//
//   const VariousDiscs(this.numberOfDiscs);
//
//   @override
//   _VariousDiscsState createState() => _VariousDiscsState();
//   // State<VariousDiscs> createState() => _VariousDiscsState();
// }
//
// class _VariousDiscsState extends State<VariousDiscs> {
//   final _discs = <DiscData>[];
//   bool _isRecording = false;
//   FlutterSoundRecorder? _audioRecorder;
//   FlutterSoundPlayer? _audioPlayer;
//   int _Counter = 30;
//   late Timer _timer;
//   bool playrec = false;
//   bool stoprec = false;
//   bool startrec = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _makeDiscs();
//     _initializeAudio();
//   }
//
//   void _initializeAudio() {
//     _audioRecorder = FlutterSoundRecorder();
//     _audioPlayer = FlutterSoundPlayer();
//     _audioPlayer!.openAudioSession();
//   }
//
//   @override
//   void dispose() {
//     _audioRecorder!.closeAudioSession();
//     _audioPlayer!.closeAudioSession();
//     super.dispose();
//   }
//
//   void _makeDiscs() {
//     _discs.clear();
//     for (int i = 0; i < widget.numberOfDiscs; i++) {
//       _discs.add(DiscData());
//     }
//   }
//
//   double buttonheight = 150;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFFF1000),
//       child: SizedBox.expand(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   if (startrec)
//                     _isRecording
//                         ? Text('Recording...')
//                         : ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               padding: EdgeInsets.all(5.0),
//                               side: const BorderSide(
//                                 color: Colors.orange,
//                                 width: 1.0,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               primary: Colors.white,
//                               //elevation: like a box shadow
//                               elevation: 10.0,
//                             ),
//                             onPressed: () {
//                               _startRecording;
//                               setState(() {
//
//                                 startrec = false;
//                                 stoprec = true;
//                                 playrec = false;
//                               });
//                             },
//                             child: const Icon(
//                               Icons.mic,
//                               color: Colors.green,
//                             )), // ElevatedButton(
//
//                   if (stoprec)
//                     ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.all(5.0),
//                           side: const BorderSide(
//                             color: Colors.orange,
//                             width: 1.0,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           primary: Colors.white,
//                           //elevation: like a box shadow
//                           elevation: 10.0,
//                         ),
//                         onPressed: () {
//                           _stopRecording;
//                           setState(() {
//
//                             startrec = true;
//                             playrec = true;
//                             stoprec = false;
//                           });
//                         },
//                         child: const Icon(
//                           Icons.mic_none,
//                           color: Colors.red,
//                         )),
//                   const SizedBox(
//                     width: 10,
//                   ),
//
//                   if (playrec)
//                     ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.all(5.0),
//                           side: const BorderSide(
//                             color: Colors.orange,
//                             width: 1.0,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           primary: Colors.white,
//                           //elevation: like a box shadow
//                           elevation: 10.0,
//                         ),
//                         onPressed:(){
//     _playRecordedAudio;
//     },
//                         child: const Icon(
//                           Icons.headphones,
//                           color: Colors.blue,
//                         )), // ElevatedButton(
//                 ],
//               ),
//               Expanded(
//                 child: SizedBox(
//                   height: 300,
//                   child: Stack(
//                     children: [
//                       GestureDetector(
//                         onTap: () => setState(() {
//                           _makeDiscs();
//                         }),
//                         child: Stack(children: [
//                           for (final disc in _discs)
//                             Positioned.fill(
//                               child: AnimatedAlign(
//                                 duration: const Duration(milliseconds: 500),
//                                 curve: Curves.easeInOut,
//                                 alignment: disc.alignment,
//                                 child: AnimatedContainer(
//                                   duration: const Duration(milliseconds: 500),
//                                   decoration: BoxDecoration(
//                                     color: disc.color,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   height: disc.size,
//                                   width: disc.size,
//                                 ),
//                               ),
//                             ),
//                         ]),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: SizedBox(
//                           height: buttonheight,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black),
//                             onPressed: () {
//                               setState(
//                                 () {
//                                   _makeDiscs();
//                                 },
//                               );
//                               final player = AudioPlayer();
//                               player.play(AssetSource('note1.wav'));
//                               print("Play");
//                             },
//                             child: const Text(
//                               "",
//                               style:
//                                   TextStyle(color: Colors.teal, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: SizedBox(
//                           height: buttonheight,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white),
//                             onPressed: () {
//                               setState(
//                                 () {
//                                   _makeDiscs();
//                                   // await Future.delayed(Duration(seconds: 2));
//                                   //_makeDiscs();
//                                 },
//                               );
//                               final player = AudioPlayer();
//                               player.play(AssetSource('note2.wav'));
//
//                               print("Play");
//                             },
//                             child: const Text(
//                               "",
//                               style:
//                                   TextStyle(color: Colors.teal, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: SizedBox(
//                           height: buttonheight,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black),
//                             onPressed: () {
//                               setState(
//                                 () {
//                                   _makeDiscs();
//                                   // await Future.delayed(Duration(seconds: 2));
//                                   //_makeDiscs();
//                                 },
//                               );
//                               final player = AudioPlayer();
//                               player.play(AssetSource('note3.wav'));
//
//                               print("Play");
//                             },
//                             child: const Text(
//                               "",
//                               style:
//                                   TextStyle(color: Colors.teal, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: SizedBox(
//                           height: buttonheight,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white),
//                             onPressed: () {
//                               setState(
//                                 () {
//                                   _makeDiscs();
//                                   // await Future.delayed(Duration(seconds: 2));
//                                   //_makeDiscs();
//                                 },
//                               );
//                               final player = AudioPlayer();
//                               player.play(AssetSource('note4.wav'));
//
//                               print("Play");
//                             },
//                             child: const Text(
//                               "",
//                               style:
//                                   TextStyle(color: Colors.teal, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: SizedBox(
//                           height: buttonheight,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black),
//                             onPressed: () {
//                               setState(
//                                 () {
//                                   _makeDiscs();
//                                   // await Future.delayed(Duration(seconds: 2));
//                                   //_makeDiscs();
//                                 },
//                               );
//                               final player = AudioPlayer();
//                               player.play(AssetSource('note5.wav'));
//
//                               print("Play");
//                             },
//                             child: const Text(
//                               "",
//                               style:
//                                   TextStyle(color: Colors.teal, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: SizedBox(
//                           height: buttonheight,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white),
//                             onPressed: () {
//                               setState(
//                                 () {
//                                   _makeDiscs();
//                                   // await Future.delayed(Duration(seconds: 2));
//                                   //_makeDiscs();
//                                 },
//                               );
//                               final player = AudioPlayer();
//                               player.play(AssetSource('note6.wav'));
//
//                               print("Play");
//                             },
//                             child: const Text(
//                               "",
//                               style:
//                                   TextStyle(color: Colors.teal, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: SizedBox(
//                           height: buttonheight,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black),
//                             onPressed: () {
//                               setState(
//                                 () {
//                                   _makeDiscs();
//                                   // await Future.delayed(Duration(seconds: 2));
//                                   //_makeDiscs();
//                                 },
//                               );
//                               final player = AudioPlayer();
//                               player.play(AssetSource('note7.wav'));
//
//                               print("Play");
//                             },
//                             child: const Text(
//                               "",
//                               style:
//                                   TextStyle(color: Colors.teal, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ]),
//       ),
//     );
//   }
//
//   void _startRecording() async {
//     if (await _requestPermission(Permission.microphone)) {
//       String filePath = await _getFilePath();
//       await _audioRecorder!.openAudioSession();
//       await _audioRecorder!.startRecorder(
//         toFile: filePath,
//         codec: Codec.aacMP4,
//       );
//       setState(() => _isRecording = true);
//     } else {
//       print('Permission denied.');
//     }
//   }
//
//   void _stopRecording() async {
//     await _audioRecorder!.stopRecorder();
//     setState(() => _isRecording = false);
//   }
//
//   Future<String> _getFilePath() async {
//     Directory appDir = await getApplicationDocumentsDirectory();
//     String filePath = appDir.path + '/recorded_audio.aac';
//     return filePath;
//   }
//
//   Future<bool> _requestPermission(Permission permission) async {
//     PermissionStatus status = await permission.request();
//     return status.isGranted;
//   }
//
//   void _playRecordedAudio() async {
//     String filePath = await _getFilePath();
//     await _audioPlayer!.startPlayer(
//       fromURI: filePath,
//       codec: Codec.aacMP4,
//     );
//   }
// }
// //********************Drum Page**************************//
//
// class DrumPage extends StatefulWidget {
//   final int numberOfDiscs;
//   const DrumPage(this.numberOfDiscs);
//
//   @override
//   State<DrumPage> createState() => _DrumPageState();
// }
//
// class _DrumPageState extends State<DrumPage> {
//   final _discs = <DiscData>[];
//
//   @override
//   void initState() {
//     super.initState();
//     _makeDiscs();
//   }
//
//   void _makeDiscs() {
//     _discs.clear();
//     for (int i = 0; i < widget.numberOfDiscs; i++) {
//       _discs.add(DiscData());
//     }
//   }
//
//   double buttonheight = 150;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFF78909C),
//       child: SizedBox.expand(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   height: 300,
//                   child: Stack(
//                     children: [
//                       GestureDetector(
//                         onTap: () => setState(() {
//                           _makeDiscs();
//                         }),
//                         child: Stack(children: [
//                           for (final disc in _discs)
//                             Positioned.fill(
//                               child: AnimatedAlign(
//                                 duration: const Duration(milliseconds: 500),
//                                 curve: Curves.easeInOut,
//                                 alignment: disc.alignment,
//                                 child: AnimatedContainer(
//                                   duration: const Duration(milliseconds: 500),
//                                   decoration: BoxDecoration(
//                                     color: disc.color,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   height: disc.size,
//                                   width: disc.size,
//                                 ),
//                               ),
//                             ),
//                         ]),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Customcontainer(context),
//                       Secondbutton(context),
//                       Thirdbutton(context),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Secondbutton(context),
//                       Thirdbutton(context),
//                       Customcontainer(context),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Thirdbutton(context),
//                       Customcontainer(context),
//                       Secondbutton(context),
//                     ],
//                   )
//                 ],
//               )
//             ]),
//       ),
//     );
//   }
//
//   Customcontainer(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 70,
//         width: 70,
//         decoration: const BoxDecoration(
//           //color: Colors.red,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey,
//               offset: Offset(0.0, 0.0),
//               blurRadius: 10.0,
//               spreadRadius: 0.0,
//             )
//           ],
//         ),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: Colors.purple,
//             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: Text(
//             "",
//             style: TextStyle(fontSize: 40),
//           ),
//           onPressed: () {
//             setState(
//               () {
//                 _makeDiscs();
//               },
//             );
//             final player = AudioPlayer();
//             player.play(AssetSource('drum1.wav'));
//           },
//         ),
//       ),
//     );
//   }
//
//   Secondbutton(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 70,
//         width: 70,
//         decoration: const BoxDecoration(
//           //color: Colors.red,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey,
//               offset: Offset(0.0, 0.0),
//               blurRadius: 10.0,
//               spreadRadius: 0.0,
//             )
//           ],
//         ),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: Colors.pink,
//             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: Text(
//             "",
//             style: TextStyle(fontSize: 40),
//           ),
//           onPressed: () {
//             setState(
//               () {
//                 _makeDiscs();
//               },
//             );
//             final player = AudioPlayer();
//             player.play(AssetSource('Drum2.wav'));
//           },
//         ),
//       ),
//     );
//   }
//
//   Thirdbutton(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 70,
//         width: 70,
//         decoration: const BoxDecoration(
//           //color: Colors.red,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey,
//               offset: Offset(0.0, 0.0),
//               blurRadius: 10.0,
//               spreadRadius: 0.0,
//             )
//           ],
//         ),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: Colors.deepOrange,
//             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: Text(
//             "",
//             style: TextStyle(fontSize: 40),
//           ),
//           onPressed: () {
//             setState(
//               () {
//                 _makeDiscs();
//               },
//             );
//             final player = AudioPlayer();
//             player.play(AssetSource('drum3.wav'));
//           },
//         ),
//       ),
//     );
//   }
// }
