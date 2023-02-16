import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semsark/ad_model.dart';
import 'package:semsark/components/custom_drop_down_field.dart';
import 'package:semsark/components/custom_input_field.dart';
import 'package:semsark/components/numaric_data_field.dart';
import 'package:semsark/screens/islam_screens/helper.dart';
import 'package:semsark/sevices/create_ad_services.dart';
import 'package:semsark/sevices/firebase_services.dart';

class CreateAd extends StatefulWidget {
  CreateAd({Key? key}) : super(key: key);

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  CreateAdServices createAdServices = CreateAdServices();

  var type_val = "ALL";
  var signal_val = "ALL";
  bool enable = false;
  bool complete = false;
  bool is_progress = false;

  bool isChecked = false;

  var cat_value, fin_value;
  var num_of_rooms = 1,
      num_of_bath_rooms = 1,
      num_of_halls = 1,
      num_of_level = 1;

  var type_key = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = GlobalKey();
  var signal_key = GlobalKey();

  dynamic types = ["ALL", "APARTMENT", "DUPLEX", "STUDIO"];
  dynamic signals = ["ALL", "Vodafone", "Orange", "Etisalat", "WE"];
  List<XFile> photos = [];
  List<String> paths = [];

  final TextEditingController titleController = TextEditingController(text: "");
  final TextEditingController priceController = TextEditingController(text: "");
  final TextEditingController areaController = TextEditingController(text: "");
  final TextEditingController detailsController =
      TextEditingController(text: "");

  @override
  void initState() {
    setState(() {
      cat_value = "RENT";
      fin_value = "YES";
      WidgetsFlutterBinding.ensureInitialized();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              color: Colors.white30,
              child: const Center(
                child: Text(
                  "ENTER THE HOUSE DETAILS",
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
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFieldInput(
                              txt: "Title",
                              controller: titleController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFieldInput(
                              txt: "Price",
                              inputType: const TextInputType.numberWithOptions(
                                  decimal: true),
                              maxLen: 10,
                              controller: priceController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFieldInput(
                              txt: "Area",
                              inputType: TextInputType.number,
                              maxLen: 10,
                              controller: areaController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomDropDownField(
                              labelText: "Type",
                              key: type_key,
                              list: types,
                              value: type_val,
                              onChange: (newValue) {
                                setState(() {
                                  type_val = newValue.toString();
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomDropDownField(
                              labelText: "Signal Power",
                              key: signal_key,
                              list: signals,
                              value: signal_val,
                              onChange: (newValue) {
                                setState(() {
                                  signal_val = newValue.toString();
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomFieldInput(
                              txt: "Details",
                              maxLen: 500,
                              maxLine: 10,
                              controller: detailsController,
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
                                          "CATEGORY",
                                          style: Helper.textStyle,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                            value: "RENT",
                                            groupValue: cat_value,
                                            onChanged: (value) {
                                              setState(() {
                                                cat_value = value;
                                              });
                                            },
                                          ),
                                          const Text("RENT"),
                                          Radio(
                                            value: "SELL",
                                            groupValue: cat_value,
                                            onChanged: (value) {
                                              setState(() {
                                                cat_value = value;
                                              });
                                            },
                                          ),
                                          const Text("SELL"),
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
                                            groupValue: fin_value,
                                            onChanged: (value) {
                                              setState(() {
                                                fin_value = value;
                                              });
                                            },
                                          ),
                                          const Text("YES"),
                                          Radio(
                                            value: "NO",
                                            groupValue: fin_value,
                                            onChanged: (value) {
                                              setState(() {
                                                fin_value = value;
                                              });
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
                            Column(
                              children: [
                                Row(
                                  children: [
                                    CustomNumaricDataField(
                                      txt_value: "ROOMS",
                                      data: num_of_rooms,
                                      onMinPressed: () {
                                        setState(() {
                                          num_of_rooms = max(num_of_rooms - 1, 0);
                                        });
                                      },
                                      onPlusPressed: () {
                                        setState(() {
                                          num_of_rooms = min(num_of_rooms + 1, 10);
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    CustomNumaricDataField(
                                      txt_value: "BATHROOM",
                                      data: num_of_bath_rooms,
                                      onMinPressed: () {
                                        setState(() {
                                          num_of_bath_rooms =
                                              max(num_of_bath_rooms - 1, 1);
                                        });
                                      },
                                      onPlusPressed: () {
                                        setState(() {
                                          num_of_bath_rooms =
                                              min(num_of_bath_rooms + 1, 10);
                                        });
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
                                      data: num_of_level,
                                      onMinPressed: () {
                                        setState(() {
                                          num_of_level = max(num_of_level - 1, 0);
                                        });
                                      },
                                      onPlusPressed: () {
                                        setState(() {
                                          num_of_level = min(num_of_level + 1, 30);
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    CustomNumaricDataField(
                                      txt_value: "HALLS",
                                      data: num_of_halls,
                                      onMinPressed: () {
                                        setState(() {
                                          num_of_halls = max(num_of_halls - 1, 0);
                                        });
                                      },
                                      onPlusPressed: () {
                                        setState(() {
                                          num_of_halls = min(num_of_halls + 1, 10);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadiusDirectional.circular(10),
                              ),
                              width: double.infinity,
                              child: photos.isEmpty
                                  ? InkWell(
                                onTap: pick_photo,
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
                                        "Take a pictur for a house",
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
                                  : list_of_photos(),
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
                                onPressed: enable && complete
                                    ? validator
                                    : () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      complete = true;
                                    });
                                  } else {
                                    setState(() {
                                      complete = false;
                                    });
                                  }
                                },
                                //rgba(69, 166, 221, 1)
                                color: enable
                                    ? Colors.white
                                    .withRed(69)
                                    .withGreen(166)
                                    .withBlue(221)
                                    : Colors.grey,
                                enableFeedback: enable,
                                child: const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Complete your adding",
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
                  ),
                  is_progress ? Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.white70,
                      ),
                      const Center(
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ):const SizedBox(width: double.infinity,),
                ],
              )
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> upload_photo(XFile element) async {
    final FirebaseServices firebaseServices = FirebaseServices();
    String email = "se3da";
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    await firebaseServices
        .upload_image(File(element.path), email, "$currentTime")
        .then((value) {
      firebaseServices.get_url(email, "$currentTime").then((path) {
        print(path);
        paths.add(path);
        print("added sucess");
        setState(() {
          enable = true;
          is_progress = false;
        });
      });
    });
  }

  void pick_photo() async {
    ImagePicker _picker = ImagePicker();
    final photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      photos.add(photo!);
      enable = false;
      is_progress = true ;
    });
    upload_photo(photo!);
  }

  void validator() {
    setState(() {
      is_progress = true ;
    });
    print("Clicked!");
    bool isFinshed = (fin_value == "YES");
    CreateAdModel model = CreateAdModel(
        paths,
        signal_val,
        titleController.text,
        cat_value,
        detailsController.text,
        priceController.text,
        "30.997881",
        "30.784451",
        areaController.text,
        "$num_of_rooms",
        "$num_of_bath_rooms",
        "$num_of_halls",
        "$num_of_level",
        isFinshed,
        true,
        type_val);
    createAdServices.postAd(model).then((value) {
      print("sucsessfully");
      setState(() {
        is_progress = false ;
      });
    }).catchError((e){
      print(enable) ;
      setState(() {
        is_progress = false ;
      });
    });
    paths = [];
  }

  Widget list_of_photos() {
    List<Widget> col = [], row = [];
    for (var element in photos) {
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
        onTap: pick_photo,
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
