// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/screens/loginpage.dart';
import 'package:mobile/screens/reset-passw.dart';
import 'package:mobile/widgets/ashesilogo.dart';
import 'package:mobile/widgets/text-input-inverse.dart';
import '../palatte.dart';
import '../widgets/password-input.dart';
import '../widgets/widgets.dart';
import 'package:email_auth/email_auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // const LoginPage({ Key? key }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  EmailAuth emailAuth =
      new EmailAuth(sessionName: "Safe Haven - Password Recovery");

  void sendOTP() async {
    bool response =
        await emailAuth.sendOtp(recipientMail: emailController.text);
    if (response) {
      // Tell user OTP has been sent
    } else {
      // OTP not sent
    }
  }

  bool verify() {
    bool response = emailAuth.validateOtp(
        recipientMail: emailController.text, userOtp: otpController.text);

    if (response) {
      // Navigatte to registration page
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PasswordReset(
                userEmail: emailController.text,
              )));
    } else {
      // Invalid OTP
    }

    return true;
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
                Navigator.pop(context);
              },
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Align(
                alignment: Alignment(-.45, 0),
                child: Text(
                  'Forgot Password',
                  style: redBold,
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
                  controller: emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => sendOTP(),
                      child: Text(
                        'Send OTP',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextInput(
                  icon: FontAwesomeIcons.code,
                  hint: "Enter OTP",
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                  controller: otpController,
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
                        verify();
                      }, // sets navigation for when login button is hit
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0), //height of box/placement
                        child: Text(
                          'Validate OTP',
                          style: redButton,
                        ),
                      )),
                ),
              )
            ],
          ),
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
