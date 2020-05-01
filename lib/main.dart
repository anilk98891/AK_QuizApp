import 'package:anilquizapp/EnterName.dart';
import 'package:anilquizapp/LoadingScreen.dart';
import 'package:anilquizapp/QuizScreen.dart';
import 'package:anilquizapp/ResultScreen.dart';
import 'package:anilquizapp/SelectionHomeScreen.dart';
import 'package:anilquizapp/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => SplashScreen(),
      '/loading' : (context) => Loading(),
      '/choice' : (context) => SelectionHomeScreen(),
      '/name' : (context) => EnterName(),
      '/quiz' : (context) => QuizScreen(),
      '/result' : (context) => ResultScreen(),
    },
  )
);
