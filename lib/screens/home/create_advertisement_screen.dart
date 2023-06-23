import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semsark/components/custom_drop_down_field.dart';
import 'package:semsark/components/custom_input_field.dart';
import 'package:semsark/components/loading_screen.dart';
import 'package:semsark/components/numaric_data_field.dart';
import 'package:semsark/provider/create_ad_provider.dart';
import 'package:semsark/provider/home_provider.dart';
import 'package:semsark/utils/helper.dart';
import 'package:provider/provider.dart';

import '../../Repo/home_services.dart';


class CreateAdvertisementScreen extends StatelessWidget {
  var typeKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = GlobalKey();
  var signal_key = GlobalKey();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var provider = Provider.of<CreateAdvertisementProvider>(context) ;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _ui(provider , width , context),
    );
  }

  _ui(CreateAdvertisementProvider provider , width , context){
    if(provider.isLoading) return const LoadingScreen() ;
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width,
            padding: const EdgeInsets.all(10),
            color: Colors.white30,
            child: const Center(
              child: Text(
                "ENTER THE BUILDING DETAILS",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Center(
                          child: ToggleButtons(
                            borderRadius: BorderRadius.circular(8),
                            selectedColor: Colors.white,
                            fillColor: Helper.blue,
                            onPressed: (int index) {
                              for (int i = 0;
                              i < provider.isSelected.length;
                              i++) {
                                provider.isSelected[i] = i == index;
                              }
                              provider.notifyListeners();
                              print(provider.isSelected);
                            },
                            isSelected: provider.isSelected,
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
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFieldInput(
                          txt: "Title",
                          controller: provider.titleController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomFieldInput(
                                txt: "Price",
                                inputType: const TextInputType.numberWithOptions(
                                    decimal: true),
                                maxLen: 10,
                                controller: provider.priceController,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomFieldInput(
                                txt: "Area",
                                inputType: TextInputType.number,
                                maxLen: 10,
                                controller: provider.areaController,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomDropDownField(
                          labelText: "Type",
                          key: typeKey,
                          list: provider.types,
                          value: provider.type_val,
                          onChange: (newValue) {
                            provider.setType(newValue);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomDropDownField(
                          labelText: "Signal Power",
                          key: signal_key,
                          list: provider.signals,
                          value: provider.signal_val,
                          onChange: (newValue) {
                            provider.setSignalPower(newValue);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFieldInput(
                          txt: "Details",
                          maxLen: 500,
                          maxLine: 10,
                          controller: provider.detailsController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                CustomNumaricDataField(
                                  txt_value: "ROOMS",
                                  data: provider.num_of_rooms,
                                  onMinPressed: () {
                                    provider.setNumOfRooms( max(provider.num_of_rooms - 1, 0));
                                  },
                                  onPlusPressed: () {
                                    provider.setNumOfRooms(min(provider.num_of_rooms + 1, 10));
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomNumaricDataField(
                                  txt_value: "BATHROOM",
                                  data: provider.num_of_bath_rooms,
                                  onMinPressed: () {
                                    provider.setNumOfBathRooms(
                                        max(provider.num_of_bath_rooms - 1, 1));
                                  },
                                  onPlusPressed: () {
                                    provider.setNumOfBathRooms(
                                        min(provider.num_of_bath_rooms + 1, 10));
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                CustomNumaricDataField(
                                  txt_value: "HOUSE LEVEL",
                                  data: provider.num_of_level,
                                  onMinPressed: () {
                                    provider.setHouseLevel(max(provider.num_of_level - 1, 0));
                                  },
                                  onPlusPressed: () {
                                    provider.setHouseLevel(min(provider.num_of_level + 1, 100));
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomNumaricDataField(
                                  txt_value: "HALLS",
                                  data: provider.num_of_halls,
                                  onMinPressed: () {
                                    provider.setNumOfHalls(max(provider.num_of_halls - 1, 0));
                                  },
                                  onPlusPressed: () {
                                    provider.setNumOfHalls(min(provider.num_of_halls + 1, 10));
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "ELEVATOR",
                                      style: Helper.textStyle,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "YES",
                                        groupValue: provider.elevator,
                                        onChanged: (value) {
                                          provider.setElevator(value);
                                        },
                                      ),
                                      const Text("YES"),
                                      Radio(
                                        value: "NO",
                                        groupValue: provider.elevator,
                                        onChanged: (value) {
                                          provider.setElevator(value);
                                        },
                                      ),
                                      const Text("NO"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "FINISHED",
                                      style: Helper.textStyle,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "YES",
                                        groupValue: provider.fin_value,
                                        onChanged: (value) {
                                          provider.setFinished(value);
                                        },
                                      ),
                                      const Text("YES"),
                                      Radio(
                                        value: "NO",
                                        groupValue: provider.fin_value,
                                        onChanged: (value) {
                                          provider.setFinished(value);
                                        },
                                      ),
                                      const Text("NO"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "ACCEPT SINGLES",
                                      style: Helper.textStyle,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "YES",
                                        groupValue: provider.acceptSingle,
                                        onChanged: (value) {
                                          provider.setAcceptSingle(value);
                                        },
                                      ),
                                      const Text("YES"),
                                      Radio(
                                        value: "NO",
                                        groupValue: provider.acceptSingle,
                                        onChanged: (value) {
                                          provider.setAcceptSingle(value);
                                        },
                                      ),
                                      const Text("NO"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "ACCEPT BUSINESS",
                                      style: Helper.textStyle,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "YES",
                                        groupValue: provider.acceptBusiness,
                                        onChanged: (value) {
                                          provider.setAcceptBusiness(value);
                                        },
                                      ),
                                      const Text("YES"),
                                      Radio(
                                        value: "NO",
                                        groupValue: provider.acceptBusiness,
                                        onChanged: (value) {
                                          provider.setAcceptBusiness(value);
                                        },
                                      ),
                                      const Text("NO"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadiusDirectional.circular(10),
                          ),
                          width: double.infinity,
                          child: provider.photos.isEmpty
                              ? InkWell(
                            onTap: (){
                              pick_photo(provider);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, bottom: 20),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 70,
                                  ),
                                  Text(
                                    "Take a picture for a house",
                                    style: TextStyle(
                                      fontSize: 16,
                                      //rgba(28, 45, 87, 1)
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                              : list_of_photos(provider),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(50),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await provider.createAdvertisement() ;
                              } else {

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Complete All Fields'),
                                    duration: const Duration(seconds: 2), // Duration for which the SnackBar is displayed
                                    action: SnackBarAction(
                                      label: 'Close',
                                      onPressed: () {
                                        // Code to execute when the SnackBar action is pressed
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                            //rgba(69, 166, 221, 1)
                            color: Helper.blue,
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "CREATE",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    ) ;
  }

  void pick_photo(CreateAdvertisementProvider provider) async {
    ImagePicker _picker = ImagePicker();
    final photo = await _picker.pickImage(source: ImageSource.gallery);
    provider.photos.add(photo!) ;
  }
  Widget list_of_photos(CreateAdvertisementProvider provider) {
    List<Widget> col = [], row = [];
    for (var element in provider.photos) {
      row.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            height: 100,
            width: 110,
            child: Image.file(
              File(
                element.path,
              ),
              fit: BoxFit.fitWidth,
            )),
      ));
      if (row.length % 3 == 0) {
        col.add(Row(
          children: row,
        ));
        row = [];
      }
    }
    row.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          pick_photo(provider);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
          width: 110,
          height: 100,
          child: const Icon(Icons.camera_enhance),
        ),
      ),
    ));
    col.add(Row(
      children: row,
    ));
    return Column(
      children: col,
    );
  }
}
