import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String _labelText;
  final Color _labelColor;
  final Color _borderColor;
  final Color _cursorColor;
  final Color _outlineBorder;
  final TextInputType _type;
  final bool _isPassword;

  var controller = new TextEditingController();

  CustomTextField(
    this._labelText,
    this._labelColor,
    this._borderColor,
    this._cursorColor,
    this._outlineBorder,
    this._type,
    this._isPassword,
  );
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: _type,
      obscureText: _isPassword,
      cursorColor: _cursorColor,
      decoration: InputDecoration(
        labelText: _labelText,
        labelStyle: TextStyle(
          color: _labelColor,
        ),

        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: _outlineBorder)),
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _borderColor,
          ),
        ),
      ),
    );
  }
}
