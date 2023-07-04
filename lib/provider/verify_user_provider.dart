import 'package:flutter/cupertino.dart';
import 'package:semsark/Repo/profile_service.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/response/user_details.dart';
import '../models/response/advertisement_response_model.dart';

class VerifyUserProvider with ChangeNotifier {
  bool adClick = true;
  Favourites fav = Favourites(id: 0, userId: 0, buildings: []);
  List<Building> myAds = [];
  UserDetails ?user;
  bool loading = false;
  bool success = true;

  init() async {
    setLoading(true);
    setLoading(false);
  }

  VerifyUserProvider() {
    init();
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
