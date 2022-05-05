import 'package:flutter/material.dart';

import '../palatte.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(16)),
        child: TextButton(
          onPressed: () {}, // sets navigation for when login button is hit
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 20.0), //height of box/placement
            child: Text(
              buttonText,
              style: bodyText,
            ),
          ),
        ));
  }
}
