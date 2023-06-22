import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/location_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/Repo/remote/reomte_home_services.dart';
import 'package:semsark/models/response/user_details.dart';

import '../Repo/remote/firebase_services.dart';

class CreateAdvertisementProvider with ChangeNotifier{

  // att
  bool isConfirmed = true;
  bool isLoading = false;
  HomeServices services = RemoteHomeServices();
  late String errorMsg;

  //model att
  List<String> photoList = [];
  var cat_value = "RENT", fin_value = "YES";


  var num_of_rooms = 1,
      num_of_bath_rooms = 1,
      num_of_halls = 1,
      num_of_level = 1;
  var type_val = "ALL";
  var signal_val = "ALL";
  var types = ["ALL", "APARTMENT", "DUPLEX", "STUDIO"];
  var signals = ["ALL", "Vodafone", "Orange", "Etisalat", "WE"];
  List<XFile> photos = [];

  //
  late Position currentPosition;
  late UserDetails model;

  init() async {
    setLoading(true);
    currentPosition = await LocationServices().getCurrentPosition();
    var response = await services.getUser();
    if(response is Success) {
      model = response.response as UserDetails;
    }
    setLoading(false);
  }
  CreateAdvertisementProvider(){
    init();
  }

  setCategory(cat){
    cat_value = cat;
    notifyListeners();
  }
  setType(val){
    type_val = val;
    notifyListeners();
  }
  setSignalPower(val){
    signal_val = val;
    notifyListeners();
  }

  setFinished(finish){
    fin_value = finish;
    notifyListeners();
  }

  setNumOfRooms(num){
    num_of_rooms = num;
    notifyListeners();
  }
  setNumOfBathRooms(num){
    num_of_bath_rooms = num;
    notifyListeners();
  }
  setNumOfHalls(num){
    num_of_halls = num;
    notifyListeners();
  }
  setHouseLevel(num){
    num_of_level = num;
    notifyListeners();
  }

  setLoading(load){
    isLoading = load;
    notifyListeners();
  }


  Future uploadPhoto(XFile element) async {
    final FirebaseServices firebaseServices = FirebaseServices();
    String email = model.email;
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    await firebaseServices
        .upload_image(File(element.path), email, "$currentTime")
        .then((value) {
      firebaseServices.get_url(email, "$currentTime").then((path) {
        print(path);
        photoList.add(path);
      });
    });
  }

  //Api
  createAdvertisement() async {
    setLoading(true);
    var response = await services.getAdvertisements();
    if(response is Success){

    }else if (response is Failure){
      errorMsg = response.errorResponse as String;
    }
    setLoading(false);
  }
}