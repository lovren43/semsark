import 'dart:ui';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:semsark/components/InputField.dart';
import 'package:semsark/components/button.dart';
import 'package:semsark/components/email_input.dart';
import 'package:semsark/screens/lovren_screens/sign_in.dart';
import 'package:semsark/screens/lovren_screens/verfication_page.dart';
import 'package:semsark/screens/lovren_screens/passwordVerficationCode.dart';
import 'package:semsark/components/PasswordInputField.dart';
import 'package:semsark/screens/lovren_screens/PinCodeVerificationScreen.dart';

class newPassword extends StatefulWidget {
  const newPassword({super.key});

  @override
  State<newPassword> createState() => _newPasswordState();
}

class _newPasswordState extends State<newPassword> {
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

  GlobalKey<FormState> formKey = GlobalKey();
  String _password = '';
  String _confirmPassword = '';
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
                            TextFormField(
                              onChanged: (value) {
                                _password = value;
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
                                hintText: "New password",
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
                              onChanged: (value) {
                                _confirmPassword = value;
                              },
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return "Field is required";
                                }
                                if(_password!=_confirmPassword){
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
                                  showDialog<String>(
                                      context: context,
                                      builder:
                                          (BuildContext context) => AlertDialog(
                                                actionsAlignment:
                                                    MainAxisAlignment.center,
                                                actions: [
                                                  Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: <Widget>[
                                                        Column(
                                                          children: [
                                                            ClipRRect(
                                                                borderRadius: const BorderRadius
                                                                        .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            150),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            150)),
                                                                child:
                                                                    ImageFiltered(
                                                                  imageFilter:
                                                                      ImageFilter.blur(
                                                                          sigmaX:
                                                                              4,
                                                                          sigmaY:
                                                                              4),
                                                                  child: SizedBox(
                                                                      height: 100,
                                                                      width: double.infinity,
                                                                      child: Image.asset(
                                                                        'assets/images/back.png',
                                                                        fit: BoxFit
                                                                            .fill,
                                                                      )),
                                                                )),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                          ],
                                                        ),
                                                        Positioned(
                                                            bottom: 0,
                                                            height: 70,
                                                            child: Image.asset(
                                                              'assets/images/emailIcon.png',
                                                            )),
                                                      ]),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  const Center(
                                                    child: Text(
                                                      "Verification code has been sent to your",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF45A6DD),
                                                          fontSize: 17),
                                                    ),
                                                  ),
                                                  const Center(
                                                    child: Text(
                                                      "email adddress, Please check ",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF45A6DD),
                                                          fontSize: 17),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 130,
                                                        height: 50,
                                                        child: CustomButon(
                                                          text: "BACK",
                                                          onTap: () =>
                                                              Navigator.pop(
                                                                  context,
                                                                  'BACK'),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 0,
                                                        width: 10,
                                                      ),
                                                      SizedBox(
                                                        width: 130,
                                                        height: 50,
                                                        child: CustomButon(
                                                          text: "DONE",
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                                  return const forgetPasswordVerficationCode();
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ));
                                  setState(() {});
                                } else {}
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
