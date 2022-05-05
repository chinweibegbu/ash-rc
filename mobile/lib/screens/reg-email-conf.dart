// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/widgets/ashesilogo.dart';
import 'package:mobile/widgets/text-input-inverse.dart';
import '../palatte.dart';
import '../widgets/rounded-button.dart';
import '../widgets/text-input.dart';

class RegistrationEmail extends StatelessWidget {
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
              alignment: Alignment(-.25, 0),
              child: Text(
                'Email Confirmation',
                style: redBold,
              ),
            ),
            SizedBox(height: 9),
            Align(
              alignment: Alignment(-15, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Enter your Ashesi email and we will send you code to begin the registratiion process',
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
              child: RoundedButton(buttonText: 'Send Confirmation Code'),
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
