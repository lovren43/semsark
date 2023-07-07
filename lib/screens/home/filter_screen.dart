import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';
import 'package:semsark/provider/filter_provider.dart';
import 'package:semsark/provider/home_provider.dart';
import 'package:semsark/screens/home/home_screen.dart';
import 'package:semsark/utils/constants.dart';

import '../../utils/helper.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var homeProvider = Provider.of<HomeProvider>(context);
    var filterProvider = Provider.of<FilterProvider>(context);
    var provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed:(){
              homeProvider.setFilter(false);
              filterProvider.resetFilters();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            child: const Text("Reset"),
          ),
        ],
        title: const Text("Filter"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      const Text(
                        "Category",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: ToggleButtons(
                          borderRadius: BorderRadius.circular(8),
                          selectedColor: Colors.white,
                          fillColor: Helper.blue,
                          onPressed: (int index) {
                            for (int i = 0;
                                i < filterProvider.isSelected.length;
                                i++) {
                              filterProvider.isSelected[i] = i == index;
                            }
                            filterProvider.notifyListeners();

                          },
                          isSelected: filterProvider.isSelected,
                          children: [
                            SizedBox(
                              width: width / 4,
                              child: const Center(child: Text("Renting" ,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),

                              )),
                            ),
                            SizedBox(
                              width: width / 4,
                              child: const Center(child: Text("Selling",

                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Bedrooms",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: filterProvider.selection.entries.map((entry) {
                          return OutlinedButton(
                            onPressed: () {
                              if(entry.key==3){
                                filterProvider.setRoomMore(true);
                              }else{
                                filterProvider.setRoomMore(false);

                              }
                              filterProvider.setBedRooms(entry.key);

                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  filterProvider.selectedBedrooms == entry.key
                                      ? Colors.white
                                      : Colors.black,
                              backgroundColor:
                                  filterProvider.selectedBedrooms == entry.key
                                      ? Helper.blue
                                      : Colors.white,
                            ),
                            child: Text(entry.value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      filterProvider.roomMore ?
                      TextFormField(
                        onChanged: (data) {
                          filterProvider.setBedRooms(data.isEmpty?0:int.parse(data));
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFf1f6fb),
                          label: Text("Number of bedroom"),
                        ),
                      )
                          :Text(""),
                      const SizedBox(height: 12),
                      const Text(
                        "Bathrooms",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                            filterProvider.selection.entries.map((entry) {
                          return OutlinedButton(
                            onPressed: () {
                              if(entry.key==3){
                                filterProvider.setBathMore(true);
                              }else{
                                filterProvider.setBathMore(false);

                              }
                              filterProvider.setBathRooms(entry.key);

                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  filterProvider.selectedBathrooms == entry.key
                                      ? Colors.white
                                      : Colors.black,
                              backgroundColor:
                                  filterProvider.selectedBathrooms == entry.key
                                      ? Helper.blue
                                      : Colors.white,
                            ),
                            child: Text(entry.value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      filterProvider.bathMore ?

                         TextFormField(
                           onChanged: (data) {
                             filterProvider.setBathRooms(data.isEmpty?0:int.parse(data));
                           },
                           decoration: const InputDecoration(
                             filled: true,
                             fillColor: Color(0xFFf1f6fb),
                             label: Text("Number of bathroom"),
                           ),
                         )
                        :Text(""),

                      const SizedBox(height: 12),
                      const Text(
                        "Halls",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: filterProvider.selection.entries.map((entry) {
                          return OutlinedButton(
                            onPressed: () {
                              if(entry.key==3){
                                filterProvider.setHallsMore(true);
                              }else{
                                filterProvider.setHallsMore(false);

                              }
                              filterProvider.setHalls(entry.key);

                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  filterProvider.selectedHalls == entry.key
                                      ? Colors.white
                                      : Colors.black,
                              backgroundColor:
                                  filterProvider.selectedHalls == entry.key
                                      ? Helper.blue
                                      : Colors.white,
                            ),
                            child: Text(entry.value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      filterProvider.hallsMore ?

                      TextFormField(
                        onChanged: (data) {
                          filterProvider.setHalls(data.isEmpty?0:int.parse(data));
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFf1f6fb),
                          label: Text("Number of halls"),
                        ),
                      )
                          :Text(""),
                      const SizedBox(height: 12),
                      const Text(
                        "Property Types",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      CheckboxListTile(
                        title: const Text("Apartment"),
                        value: filterProvider.selectedPropertyTypes
                            .contains('APARTMENT'),
                        onChanged: (value) {
                          filterProvider.changeType("apartment") ;
                        },
                      ),
                      CheckboxListTile(
                        title: const Text("Duplex"),
                        value:
                            filterProvider.selectedPropertyTypes.contains('duplex'),
                        onChanged: (value) {
                          filterProvider.changeType("duplex");
                        },
                      ),
                      CheckboxListTile(
                        title: const Text("Studio"),
                        value:
                            filterProvider.selectedPropertyTypes.contains('studio'),
                        onChanged: (value) {
                          filterProvider.changeType("studio");
                        },
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Price Range",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      RangeSlider(
                        values: filterProvider.rangeValue,
                        min: 0,
                        max: 5000000,
                        divisions: 5000000,
                        activeColor: Helper.blue,
                        onChanged: (values) {
                          filterProvider.setPriceRange(values);
                        },
                        labels: RangeLabels(
                          filterProvider.rangeValue.start.round().toString(),
                          filterProvider.rangeValue.end.round().toString(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Area Range",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      RangeSlider(
                        values: filterProvider.areaRangeValue,
                        min: 0,
                        max: 5000,
                        divisions: 500,
                        activeColor: Helper.blue,
                        onChanged: (values) {
                          filterProvider.setAreaRange(values);
                        },
                        labels: RangeLabels(
                          filterProvider.areaRangeValue.start.round().toString(),
                          filterProvider.areaRangeValue.end.round().toString(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Additional Filters",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      CheckboxListTile(
                        title: const Text("Finished"),
                        value: filterProvider.finished,
                        onChanged: (value) {
                          filterProvider.setFinished(value) ;
                        },
                      ),
                      CheckboxListTile(
                        title: const Text("Single"),
                        value: filterProvider.single,
                        onChanged: (value) {
                          filterProvider.setSingle(value) ;
                        },
                      ),
                      CheckboxListTile(
                        title: const Text("Accept Business"),
                        value: filterProvider.acceptBusiness,
                        onChanged: (value) {
                          filterProvider.setAcceptBusiness(value) ;

                        },
                      ),
                      // CheckboxListTile(
                      //   title: const Text("Elevator"),
                      //   value: filterProvider.elevator,
                      //   onChanged: (value) {
                      //     filterProvider.setElevator(value);
                      //   },
                      // ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async{
                            // Perform filtering logic here
                            homeProvider.setFilter(true);
                            homeProvider.advertisements =await  filterProvider.filter() as List<AdvertisementModel>;
                            print(filterProvider.filter() );
                            provider.changePosition(HOME_PAGE);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            backgroundColor: Helper.blue,
                            disabledBackgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Apply",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
