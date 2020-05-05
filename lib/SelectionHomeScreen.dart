import 'package:anilquizapp/Designer/Button.dart';
import 'package:flutter/material.dart';

class SelectionHomeScreen extends StatefulWidget {
  @override
  _SelectionHomeScreenState createState() => _SelectionHomeScreenState();
}

class _SelectionHomeScreenState extends State<SelectionHomeScreen> {

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Choose your the difficulty level",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,letterSpacing: 2),
              ),
            ),
            customButton(
                "Easy", context, (e){
              data = data.where((element)=> element.mode == "easy").toList();
              Navigator.of(context).pushReplacementNamed('/name',
                  arguments: data);
            },Colors.black),
            customButton(
                "Medium", context, (e){
              data = data.where((element)=> element.mode == "medium").toList();
              Navigator.of(context).pushReplacementNamed('/name',
                  arguments: data);
            },Colors.black),
            customButton(
                "Hard", context, (e){
              data = data.where((element)=> element.mode == "hard").toList();
              Navigator.of(context).pushReplacementNamed('/name',
                  arguments: data);
            },Colors.black),
          ],
        ),
      ),
    );
  }
}
