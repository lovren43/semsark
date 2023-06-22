import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:semsark/components/InputField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semsark/components/button.dart';

import 'package:semsark/Repo/location_services.dart';


import '../../components/email_input.dart';
import '../home/home_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  String? email;
  PersonalInfoScreen({
    Key? key,
    this.email,
  }) : super(key: key);
  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

final List<String> genderItems = [
  'Male',
  'Female',
];

String? gender;
String? name;
String? password = '';
String? confirmPassword = '';
String? img;
PhoneNumber? phoneNumber;
final formKey = GlobalKey<FormState>();
final TextEditingController pass = TextEditingController();
final TextEditingController confirmPass = TextEditingController();

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final textFieldFocusNode = FocusNode();
  final textFieldFocusNode2 = FocusNode();

  final LocationServices _locationServices = LocationServices();

  bool _obscured = true;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      } // If focus is on text field, don't unfocused
      textFieldFocusNode.canRequestFocus = false;
      // Prevents focus if tap on eye
    });
  }

  XFile? image;

  final ImagePicker picker = ImagePicker();
  String initialCountry = 'EG';
  final TextEditingController controller = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        SizedBox(
                          width: 2,
                        ),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 2,
                        ),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // const List<String> list = <String>['Male', 'Female'];
    // String dropdownValue = list.first;
    // String genderHintText = 'Gender';
    // double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Stack(alignment: Alignment.center, children: <Widget>[
                          Column(
                            children: [
                              ClipRRect(
                                  child: ImageFiltered(
                                imageFilter:
                                    ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                                child: SizedBox(
                                    height: 130,
                                    width: double.infinity,
                                    child: Image.asset(
                                      'assets/images/back.png',
                                      fit: BoxFit.fill,
                                    )),
                              )),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            left: 20,
                            child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.white, width: 5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(80))),
                                height: 120,
                                child: Image.asset(
                                  'assets/images/Mask.png',
                                  height: 120,
                                )),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 105,
                            child: GestureDetector(
                              onTap: () {
                                myAlert();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(80))),
                                  height: 30,
                                  child: Image.asset(
                                    'assets/images/CAM.png',
                                  )),
                            ),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InputField(
                                    onChanged: (data) {
                                      name = data;
                                    },
                                    hintText: "Full Name",
                                    inputIcon: const Icon(Icons.person_outlined),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InternationalPhoneNumberInput(
                                    maxLength: 12,
                                    onInputChanged: (PhoneNumber number) {
                                      phoneNumber = number;
                                      print(phoneNumber!.phoneNumber);
                                    },
                                    onInputValidated: (bool value) {
                                      print(value);
                                    },
                                    inputDecoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xFFf1f6fb)),
                                    validator: _phoneValidator,
                                    selectorConfig: const SelectorConfig(
                                      selectorType:
                                          PhoneInputSelectorType.BOTTOM_SHEET,
                                    ),
                                    ignoreBlank: false,
                                    autoValidateMode: AutovalidateMode.disabled,
                                    selectorTextStyle:
                                        const TextStyle(color: Colors.black),
                                    initialValue: number,
                                    textFieldController: controller,
                                    formatInput: true,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: true, decimal: true),
                                    inputBorder: const OutlineInputBorder(),
                                    onSaved: (PhoneNumber number) {
                                      print('On Saved: $number');
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xFFF1F6FB),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.asset(
                                            'assets/images/gender.png',
                                            height: 5,
                                            width: 5,
                                          ),
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Color(0xFF8189B0)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.white,
                                        ))),
                                    //isExpanded: true,
                                    hint: const Text(
                                      'Gender',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    items: genderItems
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Field is required';
                                      }
                                    },
                                    onChanged: (value) {
                                      gender = value.toString();
                                      //Do something when changing the item if you want.
                                    },
                                    onSaved: (value) {
                                      gender = value.toString();
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              EmailInputField(
                                  onChanged: (data) {},
                                  hintText: widget.email,
                                  enabled: false),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: pass,
                                onChanged: (data) {
                                  password = data;
                                },
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return "Field is required";
                                  }
                                  if (data.length < 7) {
                                    return "Password must be longer that seven numbers";
                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscured,
                                focusNode: textFieldFocusNode,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF1F6FB),
                                  prefixIcon: const Icon(Icons.lock_outlined),
                                  hintText: "Password",
                                  hintStyle:
                                      const TextStyle(color: Color(0xFF8189B0)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                                  suffixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                    child: GestureDetector(
                                      onTap: _toggleObscured,
                                      child: Icon(
                                        _obscured
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: confirmPass,
                                onChanged: (val) {
                                  confirmPassword = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Field is required';
                                  }
                                  if (val != pass.text) {
                                    return 'Password must match';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscured,
                                focusNode: textFieldFocusNode2,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xFFF1F6FB),
                                  prefixIcon: const Icon(Icons.lock_outlined),
                                  hintText: "Confirm password",
                                  hintStyle:
                                      const TextStyle(color: Color(0xFF8189B0)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                                  suffixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                    child: GestureDetector(
                                      onTap: _toggleObscured,
                                      child: Icon(
                                        _obscured
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButon(
                                text: "Sign Up",
                                onTap: () async {
                                  // if (formKey.currentState!.validate()) {
                                  //   if (await SignUpServices().createUser(
                                  //       name!,
                                  //       widget.email!,
                                  //       "",
                                  //       pass.text,
                                  //       gender!,
                                  //       phoneNumber!.phoneNumber.toString())) {
                                  //       Position position = await _locationServices.getCurrentPosition(context);
                                  //       setState((){
                                  //         Navigator.pushReplacement(context, MaterialPageRoute(builder:
                                  //             (context) => HomeScreen())) ;
                                  //     });
                                  //   }
                                  // } else {}
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("or",
                                  style: TextStyle(
                                      color: Color(0xFF45A6DD), fontSize: 20)),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // const FaIcon(FontAwesomeIcons.google),
                                  Container(
                                    width: 39,
                                    height: 39,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF707070),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Icon(
                                      Icons.facebook,
                                      size: 37,
                                      color: Color(0xFF3B5998),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 0,
                                    width: 5,
                                  ),
                                  Container(
                                    width: 39,
                                    height: 39,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF707070),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Center(
                                          child: Image.asset(
                                              'assets/images/googleIcon.png')),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  String? _phoneValidator(String? p1) {
    if (p1!.startsWith("1")) {
      return null;
    } else {
      return "invalid phone number";
    }
  }
}
