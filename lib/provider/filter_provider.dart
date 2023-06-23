import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier{


  final Map<int, String> selection = {
    0: '1',
    1: '2',
    2: '3+',
  };

  int selectedBedrooms = 0;
  int selectedBathrooms = 0;
  int selectedHalls = 0;

  RangeValues rangeValue = const RangeValues(250.0, 2000000);
  RangeValues areaRangeValue = const RangeValues(0.0, 5000);

  List<String> selectedPropertyTypes = [];
  bool renting = true;
  bool selling = false;
  bool finished = false;
  bool single = false;
  bool elevator = false;
  bool acceptBusiness = false;
  List<bool> isSelected = [true, false]; // Initialize the selection state of buttons

  void resetFilters() {
    elevator = false ;
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
    notifyListeners();
  }
  setBathRooms(idx){
    selectedBathrooms = idx ;
    notifyListeners();
  }
  setHalls(idx){
    selectedHalls = idx ;
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
  setElevator(val){
    elevator = val;
    notifyListeners();
  }
  changeType(value){

    if (value != null && !selectedPropertyTypes.contains(value)) {
      selectedPropertyTypes.add(value);
    } else {
      selectedPropertyTypes.remove(value);
    }
    notifyListeners();
  }

}