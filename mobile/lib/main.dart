// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:mobile/screens/back-to-home.dart';
import 'package:mobile/screens/reg-complete.dart';
import 'package:mobile/screens/reg-conf-code.dart';
import 'package:mobile/screens/reg-email-conf.dart';
import 'package:mobile/screens/forgot-conf.dart';
import 'package:mobile/screens/forgot-pw.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/reg-new-user.dart';
import 'package:mobile/screens/report_incident.dart';
import 'package:mobile/screens/reset-passw.dart';
import 'package:mobile/screens/sensitization.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/screens/sosbutton_screen.dart';
import './screens/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASH-RC',
      // ignore: prefer_const_constructors
      home: LoginPage(),
    );
  }
}
