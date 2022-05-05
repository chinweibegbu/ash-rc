import 'package:flutter/material.dart';
import '../palatte.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 12.0), // creates space between text boxes
      child: Container(
        decoration: BoxDecoration(
          color: (Colors.white), // sets email icon color
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: hint, // default text for email input
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(icon, //specifies icon
                  color: Colors.white,
                  size: 30),
            ),
            hintStyle: bodyText,
          ),
          style: bodyText,
          keyboardType: inputType, //email vs password
          textInputAction: inputAction, // action button
        ),
      ),
    );
  }
}
