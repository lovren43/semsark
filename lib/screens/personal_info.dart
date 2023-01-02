import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semsark/components/InputField.dart';
import 'package:semsark/components/PasswordInputField.dart';
import 'package:semsark/screens/sign_up.dart';

import '../components/button.dart';
import '../components/input_digit.dart';

class personalInfoPage extends StatefulWidget {
  const personalInfoPage({super.key});

  @override
  State<personalInfoPage> createState() => _personalInfoPageState();
}

class _personalInfoPageState extends State<personalInfoPage> {
  @override
  Widget build(BuildContext context) {
const List<String> list = <String>['Male', 'Female'];
    String dropdownValue = list.first;
    String genderHintText = 'Gender';
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
                                height: 150,
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
                          height: 120,
                          child: Image.asset(
                            'assets/images/Mask.png',
                            height: 120,
                          )),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: 180,
                                  height: 80,
                                  child: InputField("First Name",
                                      const Icon(Icons.person_outlined))),
                              const SizedBox(
                                width: 20,
                                height: 0,
                              ),
                              SizedBox(
                                  width: 180,
                                  height: 80,
                                  child: InputField("Last Name",
                                      const Icon(Icons.person_outlined))),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InputField("Phone Number", const Icon(Icons.phone)),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFF1F6FB),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    'assets/images/gender.png',
                                    height: 5,
                                    width: 5,
                                  ),
                                ),
                                hintText: genderHintText,
                                hintStyle:
                                    const TextStyle(color: Color(0xFF8189B0)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                ))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 500,
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                  genderHintText = newValue;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          InputField("Email", const Icon(Icons.email_outlined)),
                          const SizedBox(
                            height: 20,
                          ),
                          PassordInputField("Password"),
                          const SizedBox(
                            height: 20,
                          ),
                          PassordInputField("Confirm Password"),
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
