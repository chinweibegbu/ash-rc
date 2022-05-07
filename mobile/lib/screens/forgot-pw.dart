// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/widgets/ashesilogo.dart';
import 'package:mobile/widgets/text-input-inverse.dart';
import '../palatte.dart';
import '../widgets/password-input.dart';
import '../widgets/widgets.dart';

class ForgotPassword extends StatelessWidget {
  // const LoginPage({ Key? key }) : super(key: key);

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
              alignment: Alignment(-.45, 0),
              child: Text(
                'Forgot Password',
                style: redBold,
              ),
            ),
            SizedBox(height: 9),
            Align(
              alignment: Alignment(-15, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Enter your Ashesi Email and we will send you code to reset your password',
                  style: caption,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextInput(
                icon: FontAwesomeIcons.envelope,
                hint: "Enter Your Email",
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
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
                    onPressed:
                        () {}, // sets navigation for when login button is hit
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0), //height of box/placement
                      child: Text(
                        'Send Confirmation Code',
                        style: redButton,
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }

  Widget buildEmail() => TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
}
