import 'package:anilquizapp/CustomFunctions/CustomAlerts.dart';
import 'package:flutter/material.dart';

Widget customBottomBar(_selectedIndex,ResponseCallback callBack){
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Quiz'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.score),
        title: Text('Scores'),
      ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.black,
    onTap: callBack,
  );
}