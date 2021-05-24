import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function eventHandler;
  final String caption;
  final Color buttonColor;
  // Color _captionColor = Colors.blue;

  CustomButton(this.eventHandler, this.caption, this.buttonColor);

  Color _captionColor() {
    if (buttonColor == Colors.blue) {
      return Colors.white;
    } else {
      return Colors.blue.shade800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 48,
      child: ElevatedButton(
        child: Text(
          caption,
          style: TextStyle(
            fontSize: 18,
            color: _captionColor(),
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.pressed)
                ? Color.fromRGBO(000, 000, 000, 0.1)
                : null;
          }),
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        ),
        onPressed: (eventHandler),
      ),
    );
  }
}
