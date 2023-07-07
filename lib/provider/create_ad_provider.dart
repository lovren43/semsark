import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/location_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/request/ad_model.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';
import 'package:semsark/utils/constants.dart';

import '../Repo/remote/firebase_services.dart';
import '../models/response/user_details.dart';

class CreateAdvertisementProvider with ChangeNotifier{

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  // att
  bool isConfirmed = true;
  bool isLoading = false;
  bool success = false;

  XFile? userImage;
  XFile? NidImage;

  HomeServices services = HomeServices();
  String errorMsg="";

  //model att
  List<String> photoList = [];
  var fin_value = "NO" , elevator = "YES" , acceptBusiness = "YES" , acceptSingle = "YES";
  var num_of_rooms = 1,
      num_of_bath_rooms = 1,
      num_of_halls = 1,
      num_of_level = 1;
  var type_val = "APARTMENT";
  var dailyPrice = "MONTHLY";
  var signal_val = "Vodafone";
  var city = "Faisal";
  var gov = "Cairo";
  var types = ["APARTMENT", "DUPLEX", "STUDIO"];
  var signals = ["Vodafone", "Orange", "Etisalat", "WE"];
  List<bool> isSelected = [true, false]; // Initialize the selection state of buttons

  List<XFile> photos = [];
  late Position currentPosition;
  Map<String , List<String>> governors = {
    'Cairo': ['Faisal','Haram'],
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
  //UserDetails? userModel;
  init() async {
    setLoading(true);
    currentPosition = await LocationServices().getCurrentPosition();
    // var response = await services.getUser();
    // if(response is Success) {
    //   userModel = response.response as UserDetails;
    //   isVerified = true ;
    //   notifyListeners();
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
  setGov(val){
    gov = val;
    notifyListeners();
  }
  setCity(val){
    city = val;
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

  setDailyPrice(num){
    dailyPrice = num;
    notifyListeners();
  }
  setLoading(load){
    isLoading = load;
    notifyListeners();
  }

  verify() async {
    setLoading(true) ;
    if(userImage!=null && NidImage != null){
      var path1 = await uploadPhoto(userImage!) ;
      var path2 = await uploadPhoto(NidImage!) ;
      var response =await HomeServices().verifyNID(path1 , path2) ;
      if(response is Success){
        if(response.response == true){
          success = true ;
        }else {
          errorMsg = "Some Error The 2 faces doesn't match,\n Please upload a clear Images" ;
        }

      }else if(response is Failure){
        errorMsg = response.errorResponse as String;
      }
    }
    else {
      errorMsg = "Please Add Photos";
    }
    setLoading(false) ;
  }

  Future<void> takeUserPhoto() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      userImage = pickedFile ;
      notifyListeners();
    }
  }
  Future<void> takeNIdPhoto() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      NidImage = pickedFile ;
      notifyListeners();
    }
  }

  Future uploadPhoto(XFile element) async {
    final FirebaseServices firebaseServices = FirebaseServices();
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    await firebaseServices
        .upload_image(File(element.path), APP_NAME, "$currentTime")
        .then((value) async {
      await firebaseServices.get_url(APP_NAME, "$currentTime").then((path) {
        return path ;
      });
    });
    return "string";
  }

  //Api
  createAdvertisement() async {
    photoList = [] ;
    for (int i = 0; i < photos.length; i++) {
      var ppp= await uploadPhoto(photos[i]);
      photoList.add(ppp);
    }
    setLoading(true);
    if(!photoList.isEmpty)
      print(photoList[0]);
    CreateAdvertisementModel model = CreateAdvertisementModel(
        photosList: photoList,
        signalPower: signal_val,
        elevator: elevator=="YES",
        acceptBusiness: acceptBusiness == "YES",
        dailyPrice: dailyPrice,
        title: titleController.text,
        category: isSelected[0] ? "RENT" : "SELL",
        apartmentDetails: detailsController.text,
        city: "Zamalek",
        gov: "Giza",
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
    setLoading(false);

    if(response is Success){
      success = true ;
      notifyListeners() ;
    }else if (response is Failure){
      print(response);
      errorMsg = response.errorResponse as String;
    }
  }

  EditAdvertisement() async {
    photoList = [] ;
    for (int i = 0; i < photos.length; i++) {
      var ppp= await uploadPhoto(photos[i]);
      photoList.add(ppp);
    }
    setLoading(true);
    if(!photoList.isEmpty)
      print(photoList[0]);
    AdvertisementModel model = AdvertisementModel(
        photosList: photoList,
        signalPower: signal_val,
        elevator: elevator=="YES",
        acceptBusiness: acceptBusiness == "YES",
        dailyPrice: dailyPrice,
        title: titleController.text,
        category: isSelected[0] ? "RENT" : "SELL",
        apartmentDetails: detailsController.text,
        city: "Zamalek",
        gov: "Giza",
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
        types: type_val, id: 1, user: , views: 0, date: DateTime.now()
    );

    var response = await services.editAdvertisement(model);
    setLoading(false);

    if(response is Success){
      success = true ;
      notifyListeners() ;
    }else if (response is Failure){
      print(response);
      errorMsg = response.errorResponse as String;
    }
  }
}