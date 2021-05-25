import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/Login.dart';
import 'package:order_and_track/Pages/Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefsdata = await SharedPreferences.getInstance();
  var email = prefsdata.getString('Email');
  runApp(MaterialApp(
      title: 'Order and track',
      theme: ThemeData(
        accentColor: Colors.blue,
        primarySwatch: Colors.pink,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.koHo().fontFamily,
      ),
      home: email == null ? MyApp() : Home()));
}
