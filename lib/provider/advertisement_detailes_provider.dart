import 'package:flutter/cupertino.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';

class AdvertisementDetailsProvider with ChangeNotifier{


  bool isLoading = false ;
  String errorMsg = "" ;
  HomeServices services = HomeServices();
  AdvertisementModel? model;
  int id = 0 ;

  setID(nId) async {
    id = nId ;
    await getAdvertisement(id) ;
    notifyListeners() ;
  }

  // AdvertisementDetailsProvider(){
  //   init();
  // }
  // init() async {
  //   await getAdvertisement(id) ;
  // }

  setLoading(newLoad){
    isLoading = newLoad ;
    notifyListeners() ;
  }

  getAdvertisement(id) async {
    setLoading(true) ;
    var response = await services.getAdvertisementById(id) ;
    if(response is Success) {
      model = response.response as AdvertisementModel ;
    }else if (response is Failure){
      errorMsg = response.errorResponse as String;
    }
    setLoading(false);
    notifyListeners();
  }

}