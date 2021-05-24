import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Pages/Home.dart';

class HttpMethods {
  var url = 'orderandtrack.000webhostapp.com';
  BuildContext _context;
  HttpMethods(this._context);

  void login(String email, String password) async {
    var data = {
      "email": email,
      "password": password,
    };
    try {
      var res = await http.post(Uri.https(url, 'login.php'), body: data);
      if (jsonDecode(res.body) == 'found') {
        Navigator.push(
            _context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
          content: Text(res.body),
          duration: Duration(seconds: 2),
        ));
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void signUp(String name, String email, String phone, String password) async {
    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Text('Please fill in all the fields'),
        duration: Duration(seconds: 2),
      ));
    } else {
      var data = {
        "email": email,
        "name": name,
        "phone": phone,
        "password": password
      };
      try {
        var res = await http.post(Uri.https(url, 'Signup.php'), body: data);
        if (jsonDecode(res.body) == 'Success') {
          Navigator.push(
              _context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
            content: Text(res.body),
            duration: Duration(seconds: 2),
          ));
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
