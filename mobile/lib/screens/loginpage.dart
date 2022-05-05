import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../palatte.dart';
import '../widgets/password-input.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            // allows for scrolling when text box is up
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Center(
                      child: Text(
                        'Safe Haven',
                        style: heading,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextInput(
                              icon: FontAwesomeIcons.envelope,
                              hint: 'Ashesi Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            PasswordInput(
                              //optimized password
                              icon: FontAwesomeIcons.lock,
                              hint: 'Enter Password',
                              inputAction: TextInputAction.done,
                            ),
                            // Container( //duplicate Email Contianer for password
                            //   decoration: BoxDecoration(
                            //     color: (Colors.white),
                            //     borderRadius: BorderRadius.circular(16),
                            //     ),
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //       contentPadding:
                            //         const EdgeInsets.symmetric
                            //         (vertical: 20),
                            //       border: InputBorder.none,
                            //       hintText: 'Ashesi Email',
                            //       prefixIcon: Padding(
                            //         padding: const EdgeInsets.
                            //         symmetric(horizontal: 20.0),
                            //         child: Icon(
                            //           FontAwesomeIcons.solidEnvelope,
                            //           color: Colors.white,
                            //           size: 30
                            //         ),
                            //       ),
                            //       hintStyle: bodyText, //font of hint
                            //     ),
                            //     style: bodyText,
                            //     keyboardType: TextInputType.
                            //     emailAddress,
                            //     textInputAction: TextInputAction.next, // next button to move to next firle
                            //   ),
                            // ),
                            Text(
                              'Forgot Password?',
                              style: bodyText,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height:
                                    (100)), // spacing between forgot password & login button
                            RoundedButton(
                                buttonText:
                                    'Login'), //sets newly created button widget's value
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom:
                                    BorderSide(color: Colors.white, width: 1),
                              )),
                              child: Text(
                                'Register New Account',
                                style: bodyText,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
