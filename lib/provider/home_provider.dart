import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/location_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';
import 'package:semsark/provider/profile_provider.dart';
import 'package:semsark/utils/helper.dart';

import '../components/map_ad_item.dart';
import '../models/response/user_details.dart';
import '../utils/constants.dart';
import 'dart:ui' as ui;
class HomeProvider with ChangeNotifier{

  // att
  bool isMap = true;
  bool isLoading = false;
  bool isVerified = false;
  HomeServices services = HomeServices();
  late String errorMsg;
  int index = 0 ;
  //
  List<AdvertisementModel>? advertisements ;
  late Position currentPosition;
  CustomInfoWindowController mapController = CustomInfoWindowController();

  Set<Marker> markers ={};

  init() async {
    setLoading(true);
    currentPosition = await LocationServices().getCurrentPosition();
    await getAllAdvertisement();
    print(advertisements);
    setLoading(false);
  }
  HomeProvider(){
    init();
  }
  changeMap(){
    isMap = !isMap;
    notifyListeners();
  }
  setLoading(load){
    isLoading = load;
    notifyListeners();
  }
  setVerified(load){
    isVerified = load;
    notifyListeners();
  }
  changePosition(_index) async {
    index = _index ;
    if(index == HOME_PAGE){
      await getAllAdvertisement();
    }
    notifyListeners();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  //Api
  getAllAdvertisement() async {
    setLoading(true);
    var response = await services.getAdvertisements();
    print(response);
    if(response is Success){
      advertisements = response.response as List<AdvertisementModel> ;
      markers = {} ;
      final Uint8List markerIcon = await getBytesFromAsset("assets/images/markerm.png", 200);

      setLoading(false);
      for(int i = 0 ; i<advertisements!.length ; i++){
        var position = LatLng(
          double.tryParse('${advertisements![i].lat}')!.toDouble() ,
          double.tryParse('${advertisements![i].lng}')!.toDouble() ,
        );
        markers.add(Marker(markerId: MarkerId("$i"),
          position: position,
          icon: BitmapDescriptor.fromBytes(markerIcon),
          onTap: (){
            mapController.addInfoWindow!(
                MapAdvertisementItem(model: advertisements![i],) ,
              position
            );
          },
        ));

      }
    }else if (response is Failure){
      errorMsg = response.errorResponse as String;
    }
    setLoading(false);
  }
}