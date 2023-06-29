import 'package:flutter/cupertino.dart';
import 'package:semsark/Repo/profile_service.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/response/user_details.dart';
import '../models/response/advertisement_response_model.dart';

class ProfileProvider with ChangeNotifier {
  bool adClick=true;
  Favourites fav = Favourites(id: 0, userId: 0, buildings: []);
  List<AdvertisementModel> myAds=[];
  UserDetails user=UserDetails(id: 0, username:"", gender:"", email: "", password: "", phone: "", rate: 0, rateSum:0, rateCounter: 0, verifyId: false, verify: false, suspended: false, deviceId: "", img: "", personalImg: "", idImg: "", myAds: [], favourites: Favourites(id: 0, userId: 0, buildings: []));
  bool loading = false;
  ProfileServices services = ProfileServices();


  init() async {
    setLoading(true);
    await getUser();
    setLoading(false);
  }

  ProfileProvider() {
    init();
  }

  Future<void> getUser() async {
    var response = await services.getUser();
    if (response is Success) {
      user = response.response as UserDetails;
      fav=user.favourites;
      myAds=user.myAds;
    }
    notifyListeners();
  }


  // Future<void> sendMessage() async {
  //   chatMessages.add(ChatMessage(receiverEmail: message.receiverEmail, message: message.message, status: true, date: message.date));
  //   await services.sendChatMessage(message);
  //   notifyListeners();
  // }

  void setLoading(loading) {
    this.loading = loading;
    notifyListeners();
  }

  void setAd() {
    adClick = !adClick;
    notifyListeners();
  }


}
