// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/widgets/ashesilogo.dart';
import 'package:mobile/widgets/text-input-inverse.dart';
import '../palatte.dart';
import '../widgets/password-input.dart';
import '../widgets/widgets.dart';

class UserRegistration extends StatelessWidget {
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
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 10),
            Align(
              alignment: Alignment(-.9, 0),
              child: Text(
                'Registration',
                style: redBold,
              ),
            ),
            Align(
              alignment: Alignment(-1.37, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Please enter your detais ',
                  style: caption,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                icon: FontAwesomeIcons.person,
                hint: "First Name",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                icon: FontAwesomeIcons.person,
                hint: "Last Name",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                icon: FontAwesomeIcons.genderless,
                hint: "Gender",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                icon: FontAwesomeIcons.graduationCap,
                hint: "Graduation Year",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                icon: FontAwesomeIcons.lockOpen,
                hint: "New Password",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                icon: FontAwesomeIcons.lock,
                hint: "Repeat Password",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: RoundedButton(buttonText: 'Register Account'),
            ),
          ],
        )));
  }

  // Widget buildText() => TextField(
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //       ),
  //       keyboardType: TextInputType.text,
  //       textInputAction: TextInputAction.done,
  //     );
}
