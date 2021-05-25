import 'package:flutter/material.dart';
import 'package:order_and_track/CustomWidgets/CustomButton.dart';
import 'package:order_and_track/CustomWidgets/CustomTextField.dart';
import '../HttpMethods/httpMethods.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  CustomTextField nameHolder = CustomTextField(
    'Full name',
    Colors.white,
    Colors.white,
    Colors.white,
    Color.fromRGBO(255, 255, 255, 0.5),
    TextInputType.name,
    false,
  );
  CustomTextField emailHolder = CustomTextField(
    'Email',
    Colors.white,
    Colors.white,
    Colors.white,
    Color.fromRGBO(255, 255, 255, 0.5),
    TextInputType.emailAddress,
    false,
  );
  CustomTextField phoneHolder = CustomTextField(
    'Phone number',
    Colors.white,
    Colors.white,
    Colors.white,
    Color.fromRGBO(255, 255, 255, 0.5),
    TextInputType.number,
    false,
  );
  CustomTextField passwordHolder = CustomTextField(
    'Password',
    Colors.white,
    Colors.white,
    Colors.white,
    Color.fromRGBO(255, 255, 255, 0.5),
    TextInputType.visiblePassword,
    true,
  );
  CustomTextField confirmPasswordHolder = CustomTextField(
    'Confirm Password',
    Colors.white,
    Colors.white,
    Colors.white,
    Color.fromRGBO(255, 255, 255, 0.5),
    TextInputType.visiblePassword,
    true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Center(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 280,
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 280,
              height: 48,
              margin: EdgeInsets.only(bottom: 8),
              child: nameHolder,
            ),
            Container(
              width: 280,
              height: 48,
              margin: EdgeInsets.only(bottom: 8),
              child: emailHolder,
            ),
            Container(
              width: 280,
              height: 48,
              margin: EdgeInsets.only(bottom: 8),
              child: phoneHolder,
            ),
            Container(
              width: 280,
              height: 48,
              margin: EdgeInsets.only(bottom: 8),
              child: passwordHolder,
            ),
            Container(
              width: 280,
              height: 48,
              child: confirmPasswordHolder,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              () {
                if (passwordHolder.controller.text ==
                    confirmPasswordHolder.controller.text) {
                  Authentication(context).signUp(
                      nameHolder.controller.text,
                      emailHolder.controller.text,
                      phoneHolder.controller.text,
                      passwordHolder.controller.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Passwords do not match'),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              'Sign Up',
              Colors.white,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      )),
    );
  }
}
