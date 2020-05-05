import 'dart:convert';
import 'package:anilquizapp/Model/QuestionModel.dart';
import 'package:anilquizapp/ScreenLoader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  QuestionsModel instanceQuestion;
 List<QuestionModel> instance;

  void setupWorldTime() async {
    dynamic object = await getCases();
    instanceQuestion = QuestionsModel.fromJson(object);
    instance = instanceQuestion.question;
    Navigator.pushReplacementNamed(context, '/topic',
        arguments: {"data": instance});
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
    return ScreenLoader();
  }
}
