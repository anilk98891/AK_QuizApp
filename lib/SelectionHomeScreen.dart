import 'package:anilquizapp/Model/QuestionModel.dart';
import 'package:flutter/material.dart';

class SelectionHomeScreen extends StatefulWidget {
  @override
  _SelectionHomeScreenState createState() => _SelectionHomeScreenState();
}

class _SelectionHomeScreenState extends State<SelectionHomeScreen> {
  QuestionModel instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Choose your the difficulty level",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 80,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(75),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/name',
                      arguments: {"level": "easy", "data": instance});
                },
                child: Text("Easy",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20,top: 20),
              height: 80,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(75),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/name',
                      arguments: {"level": "medium", "data": instance});
                },
                child: Text("Medium",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              height: 80,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(75),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/name',
                      arguments: {"level": "hard", "data": instance});
                },
                child: Text("Hard",
                    style:
                        TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
