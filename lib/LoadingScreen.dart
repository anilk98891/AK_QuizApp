import 'dart:convert';
import 'package:anilquizapp/Model/QuestionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  QuestionsModel instanceQuestion;
 List<QuestionModel> instance;

  String userName;

  void setupWorldTime() async {
    dynamic object = await getCases();
    print(object);
    instanceQuestion = QuestionsModel.fromJson(object);
    instance = instanceQuestion.question;
    print(instanceQuestion);
    Navigator.pushReplacementNamed(context, '/quiz',
        arguments: {"data": instance, "name": userName});
  }

  Future<dynamic> getCases() async {
    try {
      Response response =
          await get('https://my-json-server.typicode.com/anilk98891/Covid19/db');
      return (jsonDecode(response.body));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Fectching Question for you.. Please wait",
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
