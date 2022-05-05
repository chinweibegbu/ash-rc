// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AshesiLogo extends StatelessWidget {
  const AshesiLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/images/ashesilogo.png',
        ),
        // fit: BoxFit.cover,
        // colorFilter:
        //     ColorFilter.mode(Colors.white.withOpacity(.65), BlendMode.lighten),
      )),
    );
  }
}
