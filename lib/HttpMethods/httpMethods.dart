import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/Home.dart';

class Authentication {
  var _url = 'orderandtrack.000webhostapp.com';
  BuildContext _context;
  Authentication(this._context);

  void login(String email, String password) async {
    var data = {
      "email": email,
      "password": password,
    };
    SharedPreferences prefsdata = await SharedPreferences.getInstance();
    try {
      var res = await http.post(Uri.https(_url, 'login.php'), body: data);
      if (jsonDecode(res.body) == 'found') {
        prefsdata.setString('Email', email);
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
      SharedPreferences prefsdata = await SharedPreferences.getInstance();
      try {
        var res = await http.post(Uri.https(_url, 'Signup.php'), body: data);
        if (jsonDecode(res.body) == 'Success') {
          prefsdata.setString('Email', email);
          prefsdata.setString('Name', name);
          prefsdata.setString('Phone', phone);
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
