import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:semsark/provider/home_provider.dart';


class AdvertisementMapScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context) ;
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            zoomGesturesEnabled: true,
            initialCameraPosition:
            CameraPosition(target: LatLng(
              double.tryParse('${provider.currentPosition.latitude}')!.toDouble() ,
              double.tryParse('${provider.currentPosition.longitude}')!.toDouble() ,
            ), zoom: 15),
            onMapCreated: (cotroller){
              provider.mapController.googleMapController = cotroller;
            },
            onCameraMove: (position) {
              provider.mapController.onCameraMove!();
            },
            onTap: (po){
              print(po);
              provider.mapController.hideInfoWindow!();
            },
            myLocationEnabled: true,
            padding: const EdgeInsets.only(bottom: 90, right: 10),
            markers: provider.markers,
          ),

          CustomInfoWindow(
            controller: provider.mapController,
            height: height*0.15,
            width: width*0.85,
            offset: 35,
          ),
        ]
      ),
    );
  }
}
