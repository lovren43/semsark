import 'package:flutter/material.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/Repo/remote/reomte_home_services.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';

class HomeProvider with ChangeNotifier{

  // att
  bool isMap = true;
  bool isLoading = false;
  HomeServices services = RemoteHomeServices();
  late String errorMsg;
  int index = 0 ;
  //
  late List<AdvertisementModel> advertisements ;

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
    if(response is Success){
      advertisements = response.response as List<AdvertisementModel> ;
    }else if (response is Failure){
      errorMsg = response.errorResponse as String;
    }
    setLoading(false);
  }
}