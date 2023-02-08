import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:semsark/components/InputField.dart';
import 'package:semsark/components/button.dart';
import 'package:semsark/screens/lovren_screens/personal_info.dart';
import 'package:semsark/screens/lovren_screens/sign_in.dart';
import 'package:semsark/screens/lovren_screens/sign_up.dart';

import 'package:semsark/components/input_digit.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(150),
                                  bottomRight: Radius.circular(150)),
                              child: ImageFiltered(
                                imageFilter:
                                    ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                                child: SizedBox(
                                    height: 200,
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
                          height: 120,
                          child: Image.asset(
                            'assets/images/emailIcon.png',
                            height: 120,
                          )),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const Text("Verification",
                              style: TextStyle(
                                  color: Color(0xFF7f88b3), fontSize: 30)),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Enter the six digit code we sent to your",
                            style: TextStyle(
                                color: Color(0xFF7f88b3), fontSize: 17),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "email address to verify your new account:",
                            style: TextStyle(
                                color: Color(0xFF7f88b3), fontSize: 17),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 40, child: inputDigit()),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(width: 40, child: inputDigit()),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(width: 40, child: inputDigit()),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(width: 40, child: inputDigit()),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(width: 40, child: inputDigit()),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(width: 40, child: inputDigit()),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("If you did't receive the code !  ",
                                  style: TextStyle(
                                    color: Color(0xFF7f88b3),
                                    fontSize: 17,
                                  )),
                              Text("Resend",
                                  style: TextStyle(
                                      color: Color(0xFFe87476),
                                      fontSize: 17,
                                      decoration: TextDecoration.underline))
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          CustomButon(
                            text: 'Verify',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const personalInfoPage();
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpPage();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
