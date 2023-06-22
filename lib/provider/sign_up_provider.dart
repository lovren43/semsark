import 'package:flutter/cupertino.dart';
//import 'package:hive/hive.dart';
import 'package:semsark/Repo/remote/auth_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/request/registartion_model.dart';
import 'package:semsark/utils/constants.dart';

class SignUpProvider with ChangeNotifier {
  // att
  bool loading=false;
  String? errorMessage;
  bool success=false;
  bool showPassword = false;
  String? email;
  String? name;
  String? otp;
  String? phoneNumber;
  String? gender;
  String? password;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var otpController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var genderController = TextEditingController();

  AuthServices services = AuthServices();
  setLoading(newLoading) {
    loading = newLoading;
    notifyListeners();
  }
  setEmail(email){
    this.email=email;
    notifyListeners();
  }
  setName(name){
    this.name=name;
    notifyListeners();
  }
  setPhoneNumber(phoneNumber){
    this.phoneNumber=phoneNumber;
    notifyListeners();
  }
  setGender(gender){
    this.gender=gender;
    notifyListeners();
  }
  setPassword(password){
    this.password=password;
    notifyListeners();
  }
  setOtp(otp){
    this.otp=otp;
    notifyListeners();
  }
  setShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  verifyEmail() async {
    setLoading(true);
    var response =
    await services.verifyEmail(email);
    setLoading(false);
    print(response.toString());
    if (response is Success) {
      // var box = await Hive.openBox(MY_BOX);
      // box.put('token', response.response);
      success = true;
    } else if (response is Failure) {
      errorMessage = response.errorResponse as String?;
    }
  }

  sendOtp() async {
    setLoading(true);
    var response =
    await services.sendOtp(email);
    setLoading(false);
    if (response is Success) {
      // var box = await Hive.openBox(MY_BOX);
      // box.put('token', response.response);
      success = true;
    } else if (response is Failure) {
      errorMessage = response.errorResponse as String?;
    }
  }

  verifyOtp() async {
    setLoading(true);
    var response =
    await services.verifyOtp(email,otp);
    setLoading(false);
    if (response is Success) {
      // var box = await Hive.openBox(MY_BOX);
      // box.put('token', response.response);
      success = true;
    } else if (response is Failure) {
      errorMessage = response.errorResponse as String?;
    }
  }

  createUser() async {
    setLoading(true);
    var response =
    await services.createUser(RegisterationModel(username: name!, phone: phoneNumber!, email: email!, social: false, img: "",   password: password!, gender: ""));
    setLoading(false);
    if (response is Success) {
      // var box = await Hive.openBox(MY_BOX);
      // box.put('token', response.response);
      success = true;
    } else if (response is Failure) {
      errorMessage = response.errorResponse as String?;
    }
  }
}
