import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenLoader extends StatelessWidget {
  @override
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Please wait",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            SpinKitHourGlass(
              color: Colors.lightGreenAccent,
            ),
          ],
        ),
      ),
    );
  }
}