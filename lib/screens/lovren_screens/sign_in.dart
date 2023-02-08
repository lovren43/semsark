import 'package:flutter/material.dart';
import 'package:semsark/components/InputField.dart';
import 'package:semsark/components/PasswordInputField.dart';
import 'package:semsark/components/button.dart';
import 'package:semsark/screens/lovren_screens/sign_up.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  int? phoneNumber;
  String? password;
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                    height: 350, child: Image.asset('assets/images/logo.png')),
                const Text(
                  'PLEASE ENTER YOUR ACCOUNT HERE',
                  style: TextStyle(
                    color: Color(0xFF8189B0),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                    'Phone number', const Icon(Icons.phone_android_outlined)),
                const SizedBox(
                  height: 10,
                ),
                PassordInputField('Password'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Forget passowrd?',
                  style: TextStyle(
                    color: Color(0xFFFF6A6A),
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // const FaIcon(FontAwesomeIcons.google),
                //     Container(
                //       width: 39,
                //       height: 39,
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //             color: const Color(0xFF707070),
                //           ),
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(20))),
                //       child: const Center(
                //           child: FaIcon(
                //         FontAwesomeIcons.google,
                //         size: 25,
                //       )),
                //     ),
                //     const SizedBox(
                //       height: 0,
                //       width: 5,
                //     ),
                //     Container(
                //       width: 39,
                //       height: 39,
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //             color: const Color(0xFF707070),
                //           ),
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(20))),
                //       child: const Icon(
                //         Icons.facebook,
                //         size: 30,
                //         color: Color(0xFF3B5998),
                //       ),
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 10,
                ),
                CustomButon(text: 'Login'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont't have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        '    Sign Up',
                        style: TextStyle(color: Color(0xFF45A6DD)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
