import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:       Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(69, 166, 221, 1),
          child: Column(
              children: [
                Expanded(
                    child: Center(
                          child: Image.asset('assets/images/Animation.gif'),
                    )
                ),
                const Text('WITH YOU',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontFamily: 'Hacen',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 20,
                    )
                ),
                const SizedBox(height: 100),
              ]
          )
      )
    );
  }
}