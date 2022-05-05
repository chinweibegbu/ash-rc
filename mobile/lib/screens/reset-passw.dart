// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/widgets/ashesilogo.dart';
import 'package:mobile/widgets/text-input-inverse.dart';
import '../palatte.dart';
import '../widgets/password-input.dart';
import '../widgets/widgets.dart';

class PasswordReset extends StatelessWidget {
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
              child: TextInput(
                icon: FontAwesomeIcons.lockOpen,
                hint: "Enter New Password",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextInput(
                icon: FontAwesomeIcons.lock,
                hint: "Re-Enter New Password",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: RoundedButton(buttonText: 'Reset Password'),
            ),
          ],
        ));
  }

  Widget buildConfCode() => TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      );
}
