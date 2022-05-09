// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/loginpage.dart';
import '../palatte.dart';

class ReportComplete extends StatelessWidget {
  // const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(146, 61, 65, 1),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 50),
            Align(
              alignment: Alignment(-.75, 0),
              child: Text(
                'Success',
                style: redBold,
              ),
            ),
            SizedBox(height: 9),
            Align(
              alignment: Alignment(-15, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Your incident has been successfully submitted, please return to log in',
                  style: caption,
                ),
              ),
            ),
            SizedBox(height: 39),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(146, 61, 65, 1),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => HomeScreen())),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0), //height of box/placement
                        child: Text(
                          'Back to Home',
                          style: redButton,
                        ),
                      ),
                    ))
                // RoundedButton(buttonText: 'Back to Login'),
                ),
          ],
        )));
  }
}
