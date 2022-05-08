// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/screens/forgot-pw.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/reg-email-conf.dart';
import 'package:mobile/screens/reg-new-user.dart';
import 'package:mobile/widgets/ashesilogo.dart';
import '../palatte.dart';
import '../widgets/password-input.dart';
import '../widgets/widgets.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  // const LoginPage({ Key? key }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  ErrorMessage errorMessage = ErrorMessage();

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
                            errorMessage,
                            TextInput(
                              icon: FontAwesomeIcons.envelope,
                              hint: 'Ashesi Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              controller: emailController,
                            ),
                            PasswordInput(
                              //optimized password
                              icon: FontAwesomeIcons.lock,
                              hint: 'Enter Password',
                              inputAction: TextInputAction.done,
                              controller: passwordController,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword())),
                              child: Text(
                                'Forgot Password?',
                                style: inputText,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height:
                                    (10)), // spacing between forgot password & login button
                            // RoundedButton(
                            //     buttonText:
                            //         'Login'), //sets newly created button widget's value
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(146, 61, 65, 1),
                                    borderRadius: BorderRadius.circular(16)),
                                child: TextButton(
                                  onPressed: () {
                                    loginUser(emailController.text,
                                        passwordController.text, context);
                                  }, // sets navigation for when login button is hit
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical:
                                            20.0), //height of box/placement
                                    child: Text(
                                      'Login',
                                      style: redButton,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 10, // space between login and register
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom:
                                    BorderSide(color: Colors.white, width: 1),
                              )),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationEmail()));
                                },
                                child: Text(
                                  'Register New Account',
                                  style: inputText,
                                ),
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

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    print(email);
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8081/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(
                userId: jsonDecode(response.body),
              )));
    } else {
      // throw Exception('Unsuccessful login');
      errorMessage.color = Color.fromRGBO(255, 0, 0, 1);
    }
  }
}
