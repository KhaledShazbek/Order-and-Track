import 'package:flutter/material.dart';
import '../HttpMethods/httpMethods.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Profile'),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          onPressed: () => Authentication(context).logout(),
          child: Text('logout'),
        )
      ]),
    );
  }
}
