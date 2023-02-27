import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:semsark/components/show_ads_item.dart';

import 'helper.dart';

class Home extends StatefulWidget {
  late Position cameraPosition ;

  Home({required this.cameraPosition}) ;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static bool isMap = true;

  @override
  void initState() {
    super.initState();
  }
  void _onMapCreated(GoogleMapController _cntlr) {}
  Widget mapWidget() => SafeArea(
        child: GoogleMap(
          zoomGesturesEnabled: true,
          initialCameraPosition:
              CameraPosition(target: LatLng(
                  double.tryParse('${widget.cameraPosition.latitude}')!.toDouble() ,
                  double.tryParse('${widget.cameraPosition.longitude}')!.toDouble() ,
              ), zoom: 15),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          padding: const EdgeInsets.only(bottom: 90, right: 10),
          onLongPress: (l) {},

        ),
      );
  Widget listViewWidget() => SafeArea(
        child: ListView.builder(
            itemBuilder: (context, index) => const AdItem(), itemCount: 20),
      );
  @override
  Widget build(BuildContext context) =>Scaffold(
    body :
    isMap ? mapWidget() : listViewWidget() ,
    floatingActionButton: Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 75
        ),
        child: FloatingActionButton(
          backgroundColor: Helper.blue,
          onPressed: () {
            setState(() {
              isMap = !isMap;
            });
          },
          child: Icon(
            isMap ? Icons.list : Icons.map_outlined,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
