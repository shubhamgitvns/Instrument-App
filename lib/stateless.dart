import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // Colors.purple,
                Colors.purple,
                Colors.pinkAccent,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                            child: SizedBox(
                                height: 100,
                                child: Image.network(
                                    'https://cdn.pixabay.com/photo/2012/04/13/00/39/piano-31357_1280.png'))),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                            child: SizedBox(
                                height: 100,
                                child: Image.network(
                                    'https://cdn.pixabay.com/photo/2014/04/03/00/35/drums-308752_1280.png'))),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Piano');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Piano',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,
                              fontSize: 20,
                              // color: Color(0xFF09203f),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the game screen
                          Navigator.pushNamed(context, '/Drum');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Drum',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20,),
                        ),
                      ),
                    )
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