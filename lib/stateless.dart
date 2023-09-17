import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          //<<<<< background gradiant color>>>>>>>>>>>>>>>>>>>>>>
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple,
                Colors.pinkAccent,
              ],
            ),
          ),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //<<<<<<<<<<<<< Simple Text>>>>>>>>>>>>>>>>>>>>>>>>>>>
                const Text(
                  'Feel The Music',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                //<<<<<<<<<<<<< Simple Text>>>>>>>>>>>>>>>>>>>>>>>>>>>
                const Text(
                  'Get ready to Enjoy Instrument',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 120),
                //const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      //<<<<<<<<Piano image container>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10,
                                spreadRadius: 1.0,
                              ),
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(-2.0, -2.0),
                                blurRadius: 10,
                                spreadRadius: 1.0,
                              ),
                            ]),
                        child: Center(
                          child: InkWell(
                            //<<<<<<<<<<Piano Image>>>>>>>>>>>>>>>>>>>>>>>>
                            onTap: () {
                              print("cli");
                              Navigator.pushNamed(context, '/Piano');
                            },
                            child: Image.network(
                                'https://cdn.pixabay.com/photo/2012/04/13/00/39/piano-31357_1280.png',height: 130,),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      //<<<<<<<<<<<<<Drum Image Container>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10,
                                spreadRadius: 1.0,
                              ),
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(-2.0, -2.0),
                                blurRadius: 10,
                                spreadRadius: 1.0,
                              ),
                            ]),
                        child: Center(
                            child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/Drum');
                          },
                          child: Image.network(
                              'https://cdn.pixabay.com/photo/2014/04/03/00/35/drums-308752_1280.png',height: 120,),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
