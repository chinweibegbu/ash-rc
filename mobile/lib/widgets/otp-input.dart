import 'package:flutter/material.dart';
import '../palatte.dart';

class OTPInput extends StatelessWidget {
  const OTPInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.controller,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;

  String? get _errorMessage {
    // at any time, we can get the text from _controller.value.text
    final text = controller.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Enter your OTP';
    }
    if (text.length != 6) {
      return 'The Entered OTP is invalid';
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, TextEditingValue value, __) {
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
                        color: Color.fromRGBO(146, 61, 65, 1),
                        size: 30),
                  ),
                  hintStyle: inputText,
                  errorText: _errorMessage,
                  errorStyle: TextStyle(color: Color.fromRGBO(146, 61, 65, 1)),
                ),
                style: inputText,
                keyboardType: inputType, //email vs password
                textInputAction: inputAction, // action button
                controller: controller,
              ),
            ),
          );
        });
  }
}
