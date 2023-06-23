import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/location_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/request/ad_model.dart';
import 'package:semsark/utils/constants.dart';

import '../Repo/remote/firebase_services.dart';

class CreateAdvertisementProvider with ChangeNotifier{

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  // att
  bool isConfirmed = true;
  bool isLoading = false;
  HomeServices services = HomeServices();
  late String errorMsg;

  //model att
  List<String> photoList = [];
  var fin_value = "NO" , elevator = "YES" , acceptBusiness = "YES" , acceptSingle = "YES";


  var num_of_rooms = 1,
      num_of_bath_rooms = 1,
      num_of_halls = 1,
      num_of_level = 1;
  var type_val = "ALL";
  var signal_val = "ALL";
  var types = ["ALL", "APARTMENT", "DUPLEX", "STUDIO"];
  var signals = ["ALL", "Vodafone", "Orange", "Etisalat", "WE"];
  List<bool> isSelected = [true, false]; // Initialize the selection state of buttons

  List<XFile> photos = [];

  //
  late Position currentPosition;
  Map<String , List<String>> governors = {
    'Cairo': [],
    'Alexandria': [],
    'Port Said': [],
    'Suez' : [],
    'Luxor' : [],
    'Aswan' : [],
    'Giza' : [],
    'Red Sea' : [],
    'South Sinai' : [],
    'Beheira' : [],
    'Ismailia' : [],
    'Minya' : [],
    'Qalyubia' : [],
    'Gharbia' : [],
    'Fayoum' : [],
    'Beni Suef' : [],
    'Sharqia' : [],
    'Asyut' : [],
    'Dakahlia' : [],
    'Kafr El Sheikh' : [],
    'Damietta' : [],
    'New Valley' : [],
    'Qena' : [],
    'Sohag' : [],
    'Monufia' : [],
    'Matrouh' : [],
    'North Sinai' : [],
    'Assiut' : [],
    'Menofia' : [],
    'El Wadi El Gedid' : [],
    'Kafr El Sheikh' : [],
    'Marsa Matrouh' : [],
    'Qena' : [],
    'Aswan' : [],
    'Gharbia' : [],
    'Beni Suef' : [],
    'North Sinai' : [],
    'Sharqia' : [],
    'Qalyubia' : [],
    'Ismailia' : [],
    'Damietta' : [],
    'Suez' : [],
    'Monufia' : [],
    'Dakahlia' : [],
    'Faiyum' : [],
    'El Beheira' : [],
    'Sohag' : [],
    'Asyut' : [],
    'Red Sea' : [],
    'Luxor' : [],
    'Minya' : [],
  };
  init() async {
    setLoading(true);
    currentPosition = await LocationServices().getCurrentPosition();
    // var response = await services.getUser();
    // if(response is Success) {
    //   userModel = response.response as UserDetails;
    // }
    setLoading(false);
  }
  CreateAdvertisementProvider(){
    init();
  }

  setElevator(val){
    elevator = val;
    notifyListeners();
  }
  setAcceptBusiness(val){
    acceptBusiness = val;
    notifyListeners();
  }
  setAcceptSingle(val){
    acceptSingle = val;
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
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    await firebaseServices
        .upload_image(File(element.path), APP_NAME, "$currentTime")
        .then((value) {
      firebaseServices.get_url(APP_NAME, "$currentTime").then((path) {
        photoList.add(path);
      });
    });
  }

  //Api
  createAdvertisement() async {
    setLoading(true);
    photos.forEach((element) {
      uploadPhoto(element);
    });
    CreateAdvertisementModel model = CreateAdvertisementModel(
        photosList: photoList,
        signalPower: signal_val,
        elevator: elevator=="YES",
        acceptBusiness: acceptBusiness == "YES",
        dailyPrice: "dailyPrice",
        title: titleController.text,
        category: isSelected[0] ? "RENT" : "SELL",
        address: "address",
        des: detailsController.text,
        apartmentDetails: detailsController.text,
        city: "city",
        gov: "gov",
        price: double.parse(priceController.text),
        lng: currentPosition.longitude,
        lat: currentPosition.latitude,
        area: int.parse(areaController.text),
        numOfRoom: num_of_rooms,
        numOfBathroom: num_of_bath_rooms,
        numOfHalls: num_of_halls,
        level: num_of_level,
        finished: fin_value=="YES",
        single: acceptSingle == "YES",
        types: type_val
    );

    var response = await services.createAdvertisement(model);
    if(response is Success){

    }else if (response is Failure){
      errorMsg = response.errorResponse as String;
    }
    setLoading(false);
  }
}