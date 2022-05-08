// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/widgets/ashesilogo.dart';
import 'package:mobile/widgets/text-input-inverse.dart';
import '../palatte.dart';
import '../widgets/password-input.dart';
import '../widgets/widgets.dart';

class RegConfCode extends StatefulWidget {
  @override
  State<RegConfCode> createState() => _RegConfCodeState();
}

class _RegConfCodeState extends State<RegConfCode> {
  // const LoginPage({ Key? key }) : super(key: key);

  void verifyOtp() async {
    //var response = Email
  }

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
                'Confirmation Code',
                style: redBold,
              ),
            ),
            SizedBox(height: 9),
            Align(
              alignment: Alignment(-15, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Enter your confirmation code to confirm your identity, and begin the registratuon process',
                  style: caption,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextInput(
                icon: FontAwesomeIcons.code,
                hint: "Enter Confirmation Code",
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                controller: TextEditingController(),
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
                          'Submit Confirmation Code',
                          style: redButton,
                        ),
                      ),
                    ))
                // RoundedButton(buttonText: 'Submit Confirmation Code'),
                ),
          ],
        ));
  }
}
