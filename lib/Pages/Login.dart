import 'package:flutter/material.dart';
import 'package:order_and_track/CustomWidgets/CustomButton.dart';
import 'package:order_and_track/CustomWidgets/CustomTextField.dart';
import 'package:order_and_track/Pages/Signup.dart';

import '../HttpMethods/httpMethods.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isHidden = true;
  var _passwordController = new TextEditingController();
  CustomTextField _emailHolder = CustomTextField(
    'Email',
    Colors.white,
    Colors.white,
    Colors.white,
    Color.fromRGBO(255, 255, 255, 0.5),
    TextInputType.emailAddress,
    false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 280,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 48,
                width: 280,
                child: _emailHolder,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 48,
                width: 280,
                child: TextField(
                  controller: _passwordController,
                  obscureText: _isHidden,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 0.5))),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelText: 'password',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 280,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                () => {
                  

                  Authentication(context).login(
                    _emailHolder.controller.text,
                    _passwordController.text,
                    
                  )
                },
                'Sign In',
                Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                'OR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              CustomButton(
                  () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()))
                      },
                  'Sign Up',
                  Colors.white),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
