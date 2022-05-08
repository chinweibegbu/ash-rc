// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/screens/loginpage.dart';
import 'package:mobile/widgets/ashesilogo.dart';
import 'package:mobile/widgets/text-input-inverse.dart';
import '../palatte.dart';
import '../widgets/password-input.dart';
import '../widgets/re-password-input.dart';
import '../widgets/widgets.dart';
import 'package:http/http.dart' as http;

class PasswordReset extends StatelessWidget {
  PasswordReset({Key? key, required this.userEmail}) : super(key: key);

  final String userEmail;

  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(146, 61, 65, 1),
            leading: IconButton(
              // allows left aligned icon
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )),
        body: Column(
          children: [
            SizedBox(height: 50),
            Align(
              alignment: Alignment(-.50, 0),
              child: Text(
                'Password Reset',
                style: redBold,
              ),
            ),
            SizedBox(height: 9),
            Align(
              alignment: Alignment(-1.08, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Please enter your new password ',
                  style: caption,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: PasswordInput(
                icon: FontAwesomeIcons.lockOpen,
                hint: "Enter New Password",
                //inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
                controller: passwordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: RepeatPasswordInput(
                icon: FontAwesomeIcons.lock,
                hint: "Re-Enter New Password",
                //inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
                controller: repeatPasswordController,
                refController: passwordController,
              ),
            ),
            SizedBox(height: 24),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(146, 61, 65, 1),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextButton(
                      onPressed: () {
                        resetUserPassword(
                            userEmail, passwordController.text, context);
                      }, // sets navigation for when login button is hit
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0), //height of box/placement
                        child: Text(
                          'Reset Password',
                          style: redButton,
                        ),
                      ),
                    ))
                // RoundedButton(buttonText: 'Reset Password'),
                ),
          ],
        ));
  }

  Future<void> resetUserPassword(
      String email, String newPassword, BuildContext context) async {
    //print(email);
    final response = await http.put(
      Uri.parse('http://10.0.2.2:8081/user/reset-password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'email': email, 'password': newPassword}),
    );

    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      // throw Exception('Unsuccessful login');
      print("failure");
    }
  }

  Widget buildConfCode() => TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      );
}
