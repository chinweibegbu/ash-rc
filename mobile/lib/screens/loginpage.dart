// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/screens/forgot-pw.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/reg-email-conf.dart';
import 'package:mobile/screens/reg-new-user.dart';
import 'package:mobile/screens/report_incident_anon.dart';
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
    return SafeArea(
      child: Stack(
        children: [
          BackgroundImage(),
          //AshesiLogo(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              // allows for scrolling when text box is up
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      child: Image(
                        image: AssetImage('assets/images/ashesilogo.png'),
                        height: 80,
                      ),
                    ),
                    SizedBox(
                        height: 10), // space between Safe Haven and notif bar
                    Container(
                      height: 90, // space between Safe Haven label and Email
                      // maximum width
                      // child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
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
                                'Promoting a safe and secure community and campus',
                                style: safeAndSec,
                              ),
                            ),
                            // SizedBox(height: 9),
                            // Align(
                            //   alignment: Alignment(-20, 1),
                            //   child: Text(
                            //     'Safe Haven provides students with resources to securely report instances of sexual violence.',
                            //     style: caption,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      // ),
                    ),
                    //SizedBox(height: 0), // spacing between caption and email
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
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPassword())),
                                  child: Text(
                                    'Forgot Password?',
                                    style: inputText,
                                  ),
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
                                      // If email and password have been validated, run the login function
                                      emailController.value.text.isNotEmpty &&
                                              passwordController
                                                  .value.text.isNotEmpty
                                          ? loginUser(emailController.text,
                                              passwordController.text, context)
                                          : null;
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegistrationEmail()));
                                  },
                                  child: Text(
                                    'Register New Account',
                                    style: inputText,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom:
                                      BorderSide(color: Colors.white, width: 1),
                                )),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyAnonForm()));
                                  },
                                  child: Text(
                                    'Make an anonymous report',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(146, 61, 65, 1),
                                        decoration: TextDecoration.underline),
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
      ),
    );
  }

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    //print(email);
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
              //userId: jsonDecode(response.body),
              )));
    } else {
      // throw Exception('Unsuccessful login');
      errorMessage.color = Color.fromRGBO(255, 0, 0, 1);
    }
  }
}
