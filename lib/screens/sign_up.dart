import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:semsark/components/InputField.dart';
import 'package:semsark/components/button.dart';
import 'package:semsark/screens/sign_in.dart';
import 'package:semsark/screens/verfication_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                      ClipRRect(
                          child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                        child: SizedBox(
                            height: 400,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/back.png',
                              fit: BoxFit.fill,
                            )),
                      )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "WELCOME",
                            style: TextStyle(
                                color: Color.fromARGB(255, 240, 242, 243),
                                fontSize: 30),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "TO SEMSARK",
                            style: TextStyle(
                                color: Color.fromARGB(255, 240, 242, 243),
                                fontSize: 30),
                          ),
                        ],
                      ),
                    ]),
                    // Container(
                    //   width: double.infinity,
                    //   height: 10,
                    //   decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.only(
                    //           topRight: Radius.circular(100),
                    //           topLeft: Radius.circular(100))),
                    //   child: const SizedBox(
                    //     height: 10,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),

                      ///
                      child: Column(
                        children: [
                          const Text("Enter Your Email",
                              style: TextStyle(
                                  color: Color(0xFF45A6DD), fontSize: 23)),
                          const SizedBox(
                            height: 30,
                          ),
                          InputField('Email or phone number',
                              const Icon(Icons.email_outlined)),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButon(
                            text: 'NEXT',
                            onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      content: const Text(
                                          "Verfication code has been sent to your email address, please check."),
                                      actions: [
                                        CustomButon(
                                          text: "BACK",
                                          onTap: () =>
                                              Navigator.pop(context, 'BACK'),
                                        ),
                                        CustomButon(
                                          text: "DOne",
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return const VerificationPage();
                                                },
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    )),
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     const Text("Already have an account?"),
                          //     GestureDetector(
                          //       onTap: () {
                          //         Navigator.pop(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) {
                          //               return  SignInPage();
                          //             },
                          //           ),
                          //         );
                          //       },
                          //       child: const Text(
                          //         '    Sign In',
                          //         style: TextStyle(color: Color(0xFF45A6DD)),
                          //       ),
                          //     ),
                          //   ],
                          // ),
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
                    return SignInPage();
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
