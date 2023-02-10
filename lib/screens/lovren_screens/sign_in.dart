import 'package:flutter/material.dart';
import 'package:semsark/components/InputField.dart';
import 'package:semsark/components/PasswordInputField.dart';
import 'package:semsark/components/button.dart';
import 'package:semsark/components/email_input.dart';
import 'package:semsark/screens/lovren_screens/sign_up.dart';
import 'package:semsark/screens/lovren_screens/forgetPassword.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  int? phoneNumber;

  String? password;

  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

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
                EmailInputField('Email', const Icon(Icons.email_outlined)),
                const SizedBox(
                  height: 10,
                ),
                PassordInputField('Password'),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const forgetPasswordEmail();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Forget passowrd?',
                    style: TextStyle(
                      color: Color(0xFFFF6A6A),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButon(
                  text: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                    } else {}
                  },
                ),
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
