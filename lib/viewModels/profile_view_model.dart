import 'package:semsark/Repo/repo.dart';
import 'package:semsark/models/response/user_model.dart';

class ProfileViewModel{
  UserRepo? repo;
  UserModel? model ;
  ProfileViewModel(this.repo){
    model = UserModel("islhhhhhh","","","") ;
  }

  Future<void> getUser() async{
    var user = await repo?.getUser() ;
    model = UserModel.fromJson(user!);
  }
}