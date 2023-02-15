import 'dart:ui';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:semsark/components/InputField.dart';
import 'package:semsark/components/button.dart';
import 'package:semsark/components/email_input.dart';
import 'package:semsark/lovren_apis/forgetPassword_api.dart';
import 'package:semsark/screens/lovren_screens/sign_in.dart';
import 'package:semsark/screens/lovren_screens/passwordVerficationCode.dart';
import 'package:semsark/components/PasswordInputField.dart';
import 'package:semsark/screens/lovren_screens/PinCodeVerificationScreen.dart';

class newPassword extends StatefulWidget {
  String? email;
  String? OTP;
  newPassword(
    {
      Key? key,
      this.OTP,
      this.email,
    }
  ):super(key: key);

  @override
  State<newPassword> createState() => _newPasswordState();
}

class _newPasswordState extends State<newPassword> {
  final textFieldFocusNode = FocusNode();
  final textFieldFocusNode2 = FocusNode();
final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
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

  GlobalKey<FormState> formKey = GlobalKey();
  String password = '';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        ClipRRect(
                            child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                          child: SizedBox(
                              height: 350,
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
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            const Text("Reset your password",
                                style: TextStyle(
                                    color: Color(0xFF45A6DD), fontSize: 23)),
                            const SizedBox(
                              height: 30,
                            ),
                            // PassordInputField(
                            //     onChanged: (data) {
                            //       password = data;
                            //     },
                            //     hintText: 'Password'),
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
                              height: 10,
                            ),
                            TextFormField(
                              controller: confirmPass,
                              onChanged: (val) {
                                confirmPassword = val;
                              },
                              validator: (val){
                              if(val!.isEmpty) {
                                return 'Empty';
                              }
                              if(val != pass.text) {
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
                              height: 10,
                            ),
                            CustomButon(
                              text: 'Confirm',
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  try{
                                    forgetPassword().updatePassword(widget.email!, password, widget.OTP!);
                                  }
                                  catch(ex){
                                    print(ex);

                                  }
                                } else {}
                              },
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
                      return forgetPasswordVerficationCode();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  
  
}
