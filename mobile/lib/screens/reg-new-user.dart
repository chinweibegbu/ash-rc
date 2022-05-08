// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/screens/loginpage.dart';
import 'package:mobile/screens/reg-complete.dart';
import 'package:mobile/widgets/ashesilogo.dart';
import 'package:mobile/widgets/text-input-inverse.dart';
import '../palatte.dart';
import '../widgets/password-input.dart';
import '../widgets/widgets.dart';
import 'package:http/http.dart' as http;

class UserRegistration extends StatelessWidget {
  UserRegistration({Key? key, required this.userEmail}) : super(key: key);

  final String userEmail;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController graduationYearController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                controller: firstNameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                icon: FontAwesomeIcons.person,
                hint: "Last Name",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
                controller: lastNameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                icon: FontAwesomeIcons.genderless,
                hint: "Gender",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
                controller: genderController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                icon: FontAwesomeIcons.graduationCap,
                hint: "Graduation Year",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
                controller: graduationYearController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                icon: FontAwesomeIcons.lockOpen,
                hint: "New Password",
                inputType: TextInputType.visiblePassword,
                inputAction: TextInputAction.next,
                controller: passwordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextInput(
                  icon: FontAwesomeIcons.lock,
                  hint: "Repeat Password",
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.next,
                  controller: TextEditingController()),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(146, 61, 65, 1),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextButton(
                      onPressed: () => registerUser(
                          firstNameController.text,
                          lastNameController.text,
                          userEmail,
                          genderController.text,
                          graduationYearController.text,
                          passwordController.text,
                          context), // sets navigation for when login button is hit
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0), //height of box/placement
                        child: Text(
                          'Register Account',
                          style: redButton,
                        ),
                      ),
                    ))
                // RoundedButton(buttonText: 'Register Account'),
                ),
          ],
        )));
  }

  Future<void> registerUser(
      String firstName,
      String lastName,
      String email,
      String gender,
      String graduationYear,
      String password,
      BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8081/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'yearGroup': graduationYear,
        'email': email,
        'password': password,
        'role': {"roleId": 5}
      }),
    );

    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => RegComplete()));
    } else {
      throw Exception("Failed registration");
    }
  }
}
