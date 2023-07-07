import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semsark/Repo/profile_service.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/response/user_details.dart';
import '../models/response/advertisement_response_model.dart';
import '../utils/helper.dart';

class ProfileProvider with ChangeNotifier {

  List<AdvertisementModel> myAds = [];
  List<AdvertisementModel> fav = [];
  UserDetails user = UserDetails(id: 1, email: 'email.@email.com',);
  XFile? image ;


  bool loading = false;
  ProfileServices services = ProfileServices();
  bool showPassword = false;
  bool success = true;
  bool adClick = true;

  init() async {
    setLoading(true);
    await getUser();
    await getMyAds();
    await getMyFavourits();
    setLoading(false);
  }

  ProfileProvider() {
    init();
  }
  Future<void> getUser() async {
    setLoading(true);
    var response = await services.getUser();
    if (response is Success) {
      user = response.response as UserDetails;
    }
    setLoading(false);

    notifyListeners();
  }

  Future<void> getMyAds() async {
    setLoading(true);
    var response = await services.getMyAds();

    if (response is Success) {

      myAds = response.response as List<AdvertisementModel>;

      setLoading(false);

    }
    notifyListeners();
  }

  Future<void> getMyFavourits() async {
    //setLoading(true);
    var response = await services.getMyFavs();

    if (response is Success) {

      fav = response.response as List<AdvertisementModel>;


    }
    //setLoading(false);
    notifyListeners();
  }
  Future<void> logout() async {
    setLoading(true);
    var response = await services.logout();
    if (response is Success) {
      await Helper.setToken("");

    }
    setLoading(false);
    notifyListeners();
  }

  deleteAd(id) async{
    setLoading(true) ;
    var response = await services.deleteAd(id);
    if(response is Success) {
      await getMyAds() ;
    }
    setLoading(false) ;
  }
  setShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  setImage(_image){
    image = _image ;
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

  setAd(clk) async {
    adClick = clk;
    await getMyFavourits();
    notifyListeners();

  }
}
