import 'package:flutter/cupertino.dart';
import 'package:semsark/Repo/profile_service.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/response/user_details.dart';
import '../models/response/advertisement_response_model.dart';

class ProfileProvider with ChangeNotifier {
  bool adClick = true;
  Favourites fav = Favourites(id: 0, userId: 0, buildings: []);
  List<Building> myAds = [];
  UserDetails user = UserDetails(id: 1, email: 'emai.@email.com',);
  bool loading = false;
  ProfileServices services = ProfileServices();
  String name = "";
  String phone = "";
  String email = "";
  String password = "";
  String gender = "";
  bool showPassword = false;
  bool success = true;

  init() async {
    setLoading(true);
    await getUser();
    setLoading(false);
  }

  ProfileProvider() {
    init();
  }

  reset(){

    name = user.username!;
    email = user.email;
    gender = user.gender!;
    phone = user.phone!;
    if (user.favourites!=null){
      fav = user.favourites!;
    }
    notifyListeners() ;
  }
  Future<void> getUser() async {
    setLoading(true);
    var response = await services.getUser();
    if (response is Success) {
      user = response.response as UserDetails;
      print(user);
      reset();
      setLoading(false);

    }
    notifyListeners();
  }

  Future<void> editProfile() async{

  }

  Future<void> logout() async {
    setLoading(true);
    var response = await services.logout();
    if (response is Success) {
      print("logged out");
    }
    setLoading(false);
    notifyListeners();
  }
  // Future<void> editProfile() async {
  //   setSuccess(false);
  //   Profile userDetails = Profile(
  //       username: name,
  //       gender: gender,
  //       email: email,
  //       password: password,
  //       phone: phone,
  //       img: "");
  //
  //   var res = await services.editUser(userDetails);
  //
  //   if (res is Success) {
  //     user = res.response as UserDetails;
  //     myAds = user.myAds;
  //
  //     success = true;
  //   }
  //
  //   notifyListeners();
  // }

  setEmail(email) {
    this.email = email;
    notifyListeners();
  }

  setName(name) {
    this.name = name;
    notifyListeners();
  }

  setPhone(phoneNumber) {
    this.phone = phoneNumber;
    notifyListeners();
  }

  setGender(gender) {
    this.gender = gender;
    notifyListeners();
  }

  setPassword(password) {
    this.password = password;
    notifyListeners();
  }

  setShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void setLoading(loading) {
    this.loading = loading;
    notifyListeners();
  }

  void setSuccess(loading) {
    this.success = loading;
    notifyListeners();
  }

  void setAd(clk) {
    adClick = clk;
    notifyListeners();
  }
}
