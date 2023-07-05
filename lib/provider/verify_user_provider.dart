import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/profile_service.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/response/user_details.dart';
import '../Repo/remote/firebase_services.dart';
import '../models/response/advertisement_response_model.dart';

class VerifyUserProvider with ChangeNotifier {
  XFile? userImage;
  XFile? NidImage;
  bool loading = false;
  bool success = true;
  String ? errorMsg ;

  init() async {

  }


  Future uploadPhoto(XFile element) async {
    final FirebaseServices firebaseServices = FirebaseServices();
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    await firebaseServices
        .upload_image(File(element.path), "Verifications", "$currentTime")
        .then((value) async {
      await firebaseServices.get_url("Verifications", "$currentTime").then((path) {
        return path ;
      });
    });
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

  VerifyUserProvider() {
    init();
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

  void setLoading(loading) {
    this.loading = loading;
    notifyListeners();
  }

  void setSuccess(loading) {
    this.success = loading;
    notifyListeners();
  }
}
