import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  ErrorMessage({
    Key? key,
  }) : super(key: key);

  Color color = Color.fromRGBO(255, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Incorrect email or password',
      style: TextStyle(color: color),
    );

    // return Container(
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //         color: Color.fromRGBO(146, 61, 65, 1),
    //         borderRadius: BorderRadius.circular(16)),
    //     child: TextButton(
    //       onPressed: () {}, // sets navigation for when login button is hit
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(
    //             vertical: 20.0), //height of box/placement
    //         child: Text(
    //           buttonText,
    //           style: redButton,
    //         ),
    //       ),
    //     ));
  }
}
