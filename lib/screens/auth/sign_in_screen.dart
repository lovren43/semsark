import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:semsark/components/button.dart';
import 'package:semsark/components/email_input.dart';

import 'package:semsark/Repo/location_services.dart';

import 'package:semsark/screens/auth/forget_password_screen.dart';
import 'package:semsark/screens/auth/sign_up_screen.dart';

import '../home/home_screen.dart';
import '../home/profile_screen.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  LocationServices _locationServices = LocationServices() ;

  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController pass = TextEditingController();

  final textFieldFocusNode = FocusNode();

  bool _obscured = true;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      }
      textFieldFocusNode.canRequestFocus = false;
      // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {

    String tmp= " ";
    return tmp!="islam" ?  Profile() : Scaffold(
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
                          return const ForgetPasswordScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Forget password?',
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
                        // await LoginServices().login(email!, password!).then((value) async {
                        //   if(value){
                        //     Position position = await _locationServices.getCurrentPosition(context);
                        //     setState((){
                        //       Navigator.pushReplacement(context, MaterialPageRoute(builder:
                        //           (context) => HomeScreen())) ;
                        //     });
                        //   }
                        // });
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
                    const Flexible(child: Text("Don't have an account?",)),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SignUpScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          overflow: TextOverflow.ellipsis,
                          '    Sign Up',
                          style: TextStyle(color: Color(0xFF45A6DD)),
                        ),
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
