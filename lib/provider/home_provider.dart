import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/location_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/components/map_ad_item.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';

class HomeProvider with ChangeNotifier{

  // att
  bool isMap = true;
  bool isLoading = false;
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
  changePosition(_index){
    index = _index ;
    notifyListeners();
  }

  //Api
  getAllAdvertisement() async {
    setLoading(true);
    var response = await services.getAdvertisements();
    //print() ;
    if(response is Success){
      advertisements = response.response as List<AdvertisementModel> ;

      print(advertisements);
      for(int i = 0 ; i<advertisements!.length ; i++){
        var position = LatLng(
          double.tryParse('${advertisements![i].lat}')!.toDouble() ,
          double.tryParse('${advertisements![i].lng}')!.toDouble() ,
        );
        markers.add(Marker(markerId: MarkerId("$i"),
          position: position,
          onTap: (){
          mapController.addInfoWindow!(
            Container(
              color: Colors.white,
                child: MapAdvertisementItem(model: advertisements![i])
            ),
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