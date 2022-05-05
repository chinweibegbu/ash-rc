// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/widgets/ashesilogo.dart';
import '../palatte.dart';
import '../widgets/password-input.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        // AshesiLogo(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            // allows for scrolling when text box is up
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                      height: 100), // space between Safe Haven and notif bar
                  Container(
                    height: 253, // space between Safe Haven label and Email
                    // maximum width
                    // child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(-1.20, 1),
                            child: Text(
                              'Safe Haven',
                              style: safeHavenHeading,
                            ),
                          ),
                          Align(
                            alignment: Alignment(-25, 1),
                            child: Text(
                              'Promoting a safe and secure campus',
                              style: safeAndSec,
                            ),
                          ),
                          SizedBox(height: 9),
                          Align(
                            alignment: Alignment(-20, 1),
                            child: Text(
                              'Safe Haven provides students with resources to securely report instances of sexual violence. The service also provides victims with access to school provided counselors and trained professionals',
                              style: caption,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ),
                  ),
                  SizedBox(height: 10), // spacing between caption and email
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextInput(
                              icon: FontAwesomeIcons.envelope,
                              hint: 'Ashesi Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            PasswordInput(
                              //optimized password
                              icon: FontAwesomeIcons.lock,
                              hint: 'Enter Password',
                              inputAction: TextInputAction.done,
                            ),
                            // Container( //duplicate Email Contianer for password
                            //   decoration: BoxDecoration(
                            //     color: (Colors.white),
                            //     borderRadius: BorderRadius.circular(16),
                            //     ),
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //       contentPadding:
                            //         const EdgeInsets.symmetric
                            //         (vertical: 20),
                            //       border: InputBorder.none,
                            //       hintText: 'Ashesi Email',
                            //       prefixIcon: Padding(
                            //         padding: const EdgeInsets.
                            //         symmetric(horizontal: 20.0),
                            //         child: Icon(
                            //           FontAwesomeIcons.solidEnvelope,
                            //           color: Colors.white,
                            //           size: 30
                            //         ),
                            //       ),
                            //       hintStyle: bodyText, //font of hint
                            //     ),
                            //     style: bodyText,
                            //     keyboardType: TextInputType.
                            //     emailAddress,
                            //     textInputAction: TextInputAction.next, // next button to move to next firle
                            //   ),
                            // ),
                            Text(
                              'Forgot Password?',
                              style: inputText,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height:
                                    (10)), // spacing between forgot password & login button
                            RoundedButton(
                                buttonText:
                                    'Login'), //sets newly created button widget's value
                            SizedBox(
                              height: 10, // space between login and register
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom:
                                    BorderSide(color: Colors.white, width: 1),
                              )),
                              child: Text(
                                'Register New Account',
                                style: inputText,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
