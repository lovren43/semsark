import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:semsark/components/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        GoogleMap(
            initialCameraPosition:CameraPosition(target: LatLng(30.0276 , 31.2101), zoom: 15),
        ),
        Container(

          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 5.0),
          child: Column(
            children: [
              FloatingActionButton(onPressed:  _buttonPressed,
                backgroundColor: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  void _buttonPressed(){

  }
}