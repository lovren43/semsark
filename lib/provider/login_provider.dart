import 'package:flutter/cupertino.dart';
//import 'package:hive/hive.dart';
import 'package:semsark/Repo/remote/auth_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/utils/constants.dart';

class LoginProvider with ChangeNotifier {
  // att
  bool loading=false;
  String? errorMessage;
  bool success=false;
  bool showPassword = false;
  String email="";
  String password="";
  AuthServices services = AuthServices();
  setLoading(newLoading) {
    loading = newLoading;
    notifyListeners();
  }

  setShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  LoginProvider(){
    setLoading(true);
    errorMessage="";
    setLoading(false);
  }

  login() async {
    setLoading(true);
    var response =
        await services.login(email, password);
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
