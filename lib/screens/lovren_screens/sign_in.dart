import 'package:flutter/material.dart';
import 'package:semsark/components/InputField.dart';
import 'package:semsark/components/PasswordInputField.dart';
import 'package:semsark/components/button.dart';
import 'package:semsark/components/email_input.dart';
import 'package:semsark/lovren_apis/login_api.dart';
import 'package:semsark/screens/lovren_screens/sign_up.dart';
import 'package:semsark/screens/lovren_screens/forgetPassword.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController pass = TextEditingController();

  final textFieldFocusNode = FocusNode();

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                    height: 350, child: Image.asset('assets/images/c.png')),
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
                EmailInputField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email'),
                const SizedBox(
                  height: 10,
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
                    hintStyle: const TextStyle(color: Color(0xFF8189B0)),
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
                      try {
                        await signIN().login(email!, password!);
                      } catch (ex) {
                        print(ex);
                      }
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
