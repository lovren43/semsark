import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'helper.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late LocationData _currentPosition;
  Location location = Location();
  late GoogleMapController _controller;
  late LatLng _initialCameraPosition = const LatLng(31, 31);
  static bool isMap = true;

  @override
  void initState() {
    getLoc();
    super.initState();
  }
  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    setState(() {
      getLoc();
    });
  }

  getLoc() async {
    late bool serviceEnabled;
    late PermissionStatus _permissionGranted;
    location.serviceEnabled().then((_serviceEnabled) => {
          if (!_serviceEnabled)
            {
              location
                  .requestService()
                  .then((value) => {serviceEnabled = value})
            }
        });

    if (!serviceEnabled) return;
    location.hasPermission().then((value) => {
          if (value == PermissionStatus.denied)
            {
              location
                  .requestPermission()
                  .then((value) => {_permissionGranted = value})
            }
        });

    if (_permissionGranted != PermissionStatus.granted) return;

    location.getLocation().then((value) => {_currentPosition = value});
    _initialCameraPosition = LatLng(
        double.tryParse('${_currentPosition.latitude}')!.toDouble(),
        double.tryParse('${_currentPosition.longitude}')!.toDouble());

    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _initialCameraPosition, zoom: 15),
      ),
    );
  }

  Widget mapWidget() => SafeArea(
        child: GoogleMap(
          zoomGesturesEnabled: true,
          initialCameraPosition:
              CameraPosition(target: _initialCameraPosition, zoom: 15),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          padding: const EdgeInsets.only(bottom: 90, right: 10),
          onLongPress: (l) {},

        ),
      );
  Widget listViewWidget() => SafeArea(
        child: ListView.builder(
            itemBuilder: (context, index) => itemView(), itemCount: 20),
      );
  Widget itemView() => Container(
        margin: const EdgeInsetsDirectional.all(5),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(241, 246, 251, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              spreadRadius: 3,
              blurRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        height: 158,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsetsDirectional.only(
                    start: 8, end: 8, top: 10, bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'APARTMENT FOR RENT',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 83, 123, 1.0),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Price',
                      style: TextStyle(
                          color: Color.fromRGBO(70, 83, 123, 1.0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 28,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.bed_outlined,
                            color: Color.fromRGBO(69, 166, 221, 1),
                            size: 25,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '2',
                            style: TextStyle(
                              color: Color.fromRGBO(70, 83, 123, 1.0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.ice_skating,
                            color: Color.fromRGBO(69, 166, 221, 1),
                            size: 25,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '2',
                            style: TextStyle(
                              color: Color.fromRGBO(70, 83, 123, 1.0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.chair_rounded,
                            color: Color.fromRGBO(69, 166, 221, 1),
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                              color: Color.fromRGBO(70, 83, 123, 1.0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Expanded(
                            child: Text(
                              '6TH OF OCTOBER , GIZA',
                              style: TextStyle(
                                color: Color.fromRGBO(70, 83, 123, 1.0),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '144 M',
                            style: TextStyle(
                              color: Color.fromRGBO(70, 83, 123, 1.0),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
                color: Color.fromRGBO(241, 246, 251, 1),
                height: 156,
                width: 150,
                child: Image.asset('assets/images/logo.png')),
          ],
        ),
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
