import 'package:flutter/material.dart';
import '../palatte.dart';

class RepeatPasswordInput extends StatelessWidget {
  //specifies details of password
  const RepeatPasswordInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputAction,
    required this.controller,
    required this.refController,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final TextEditingController refController;

  String? get _errorMessage {
    // at any time, we can get the text from _controller.value.text
    final text = controller.value.text;
    final refText = refController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Field can\'t be empty';
    }
    if (text.length < 8) {
      return 'Too short';
    }
    if (text != refText) {
      return 'Passwords don\'t match';
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
                color: (Colors.white), // password box fill color
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
                      errorStyle:
                          TextStyle(color: Color.fromRGBO(146, 61, 65, 1))),
                  obscureText: true, //hides input text
                  style: inputText,
                  textInputAction: inputAction, // action button
                  controller: controller),
            ),
          );
        });
  }
}
