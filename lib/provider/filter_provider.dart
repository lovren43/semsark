import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semsark/Repo/home_services.dart';
import 'package:semsark/Repo/remote/remote_status.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';
import 'package:semsark/provider/home_provider.dart';

class FilterProvider with ChangeNotifier{

  HomeServices homeServices=HomeServices();

  final Map<int, String> selection = {
    0: '1',
    1: '2',
    2: '3',
    3:'more'
  };

  int selectedBedrooms = 0;
  bool roomMore = false;
  int selectedBathrooms = 0;
  bool bathMore = false;
  int selectedHalls = 0;
  bool hallsMore= false;

  RangeValues rangeValue = const RangeValues(250.0, 5000000);
  RangeValues areaRangeValue = const RangeValues(0.0, 5000);

  List<String> selectedPropertyTypes = [];
  bool renting = true;
  bool selling = false;
  bool finished = false;
  bool single = false;
  //bool elevator = false;
  bool acceptBusiness = false;
  List<bool> isSelected = [true, false]; // Initialize the selection state of buttons

  Future<List<AdvertisementModel>> filter() async {
    var data= {
        "category": renting ? "RENT":"SELL",
        "city": "",
        "types": selectedPropertyTypes,
        "minPrice": rangeValue.start,
        "maxPrice": rangeValue.end,
        "minArea": areaRangeValue.start,
        "maxArea": areaRangeValue.end,
        "minNumOfRoom": selectedBedrooms+1,
        "maxNumOfRoom": 20,
        "minNumOfBathroom": selectedBathrooms+1,
        "maxNumOfBathroom": 20,
        "minNumOfHalls": selectedHalls+1,
        "maxNumOfHalls": 20,
        "finished": finished,
        "single": single,
        "acceptBusiness": acceptBusiness
      };

    print(data);
    var res= await homeServices.filter(data);
    if(res is Success){

      return (res.response) as List<AdvertisementModel>;

    }
    return [];
    notifyListeners();
  }
  void resetFilters() {

    // elevator = false ;
      selectedBedrooms = 0;
      selectedBathrooms = 0;
      selectedHalls = 0;
      rangeValue = const RangeValues(0.0, 2000000);
      areaRangeValue = const RangeValues(0.0, 5000);
      selectedPropertyTypes.clear();
      renting = true;
      selling = false;
      finished = false;
      single = false;
      acceptBusiness = false;
      isSelected = [true , false] ;
      notifyListeners();
  }

  setBedRooms(idx){
    selectedBedrooms = idx ;
    print(selectedBedrooms);
    notifyListeners();
  }
  setRoomMore(val){
    roomMore=val;
    notifyListeners();
  }
  setBathRooms(idx){
    selectedBathrooms = idx ;
    print(selectedBathrooms);
    notifyListeners();
  }
  setBathMore(val){
    bathMore=val;
    notifyListeners();
  }
  setHalls(idx){
    selectedHalls = idx ;
    print(selectedHalls);
    notifyListeners();
  }
  setHallsMore(val){
    hallsMore=val;
    notifyListeners();
  }
  setPriceRange(range){
    rangeValue = range ;
    notifyListeners();
  }
  setAreaRange(range){
    areaRangeValue = range ;
    notifyListeners();
  }
  setFinished(val){
    finished = val;
    notifyListeners();
  }
  setSingle(val){
    single = val;
    notifyListeners();
  }
  setAcceptBusiness(val){
    acceptBusiness = val;
    notifyListeners();
  }
  // setElevator(val){
  //   elevator = val;
  //   notifyListeners();
  // }
  changeType(value){

    if (value != null && !selectedPropertyTypes.contains(value)) {
      selectedPropertyTypes.add(value);
    } else {
      selectedPropertyTypes.remove(value);
    }
    notifyListeners();
  }

}