import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semsark/components/InputField.dart';
import 'package:semsark/components/PasswordInputField.dart';
import 'package:semsark/screens/lovren_screens/sign_up.dart';

import 'package:semsark/components/button.dart';
import 'package:semsark/components/input_digit.dart';

import '../../components/email_input.dart';

class personalInfoPage extends StatefulWidget {
  const personalInfoPage({super.key});

  @override
  State<personalInfoPage> createState() => _personalInfoPageState();
}

final List<String> genderItems = [
  'Male',
  'Female',
];

String? gender;
String? name;
String? email;
String? password = '';
String? confirmPassword = '';
String? img;
String? phoneNumber;
final _formKey = GlobalKey<FormState>();

class _personalInfoPageState extends State<personalInfoPage> {
  final textFieldFocusNode = FocusNode();
  final textFieldFocusNode2 = FocusNode();

  bool _obscured = true;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      } // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;
      // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['Male', 'Female'];
    String dropdownValue = list.first;
    String genderHintText = 'Gender';
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
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
                            imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
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
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(80))),
                            height: 30,
                            child: Image.asset(
                              'assets/images/CAM.png',
                            )),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
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
                          InputField(
                              onChanged: (data) {
                                phoneNumber = data;
                              },
                              hintText: "Phone Number",
                              inputIcon: const Icon(Icons.phone)),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonFormField2(
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
                                  buttonHeight: 20,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
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
                                      return 'Please select gender.';
                                    }
                                  },
                                  onChanged: (value) {
                                    //Do something when changing the item if you want.
                                  },
                                  onSaved: (value) {
                                    gender = value.toString();
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          EmailInputField(
                              onChanged: (data) {
                                email = data;
                              },
                              hintText: 'Email '),
                          const SizedBox(
                            height: 20,
                          ),
                          PassordInputField(
                              onChanged: (data) {
                                password = data;
                              },
                              hintText: 'Password'),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (data) {
                              confirmPassword = data;
                            },
                            validator: (data) {
                              if (data!.isEmpty) {
                                return "Field is required";
                              }
                              if (password != confirmPassword) {
                                return "Password must match";
                              }
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
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
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
                          CustomButon(text: "Sign Up"),
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
    );
  }
}
