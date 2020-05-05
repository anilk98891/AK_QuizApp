import 'package:anilquizapp/CustomFunctions/CustomFunctions.dart';
import 'package:anilquizapp/Designer/Button.dart';
import 'package:anilquizapp/Firebase/FirebaseDatabase.dart';
import 'package:anilquizapp/Model/QuestionModel.dart';
import 'package:anilquizapp/Model/ScoreModel.dart';
import 'package:anilquizapp/ScoreCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicSelectionPage extends StatefulWidget {
  @override
  _TopicSelectionPageState createState() => _TopicSelectionPageState();
}

class _TopicSelectionPageState extends State<TopicSelectionPage> {
  List<QuestionModel> instance;
  int _selectedIndex = 0;


  buttonCallHandle(e) {
    dynamic instanceUpdated = instance.where((element) => element.category == e).toList();
    Navigator.of(context).pushNamed('/choice', arguments: instanceUpdated);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 1){
        setState(() {
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic instanceObject = ModalRoute.of(context).settings.arguments;
    instance = instanceObject["data"];
    
    final uniqueSet = Set<String>();
    List<QuestionModel> comparedArray =
        instance.where((str) => uniqueSet.add(str.category)).toList();
    
    return StreamProvider<List<ScoreModel>>.value(
      value: DataBaseService().scoreCard,
      child: Scaffold(
        bottomNavigationBar: customBottomBar(_selectedIndex, (e){
          _onItemTapped(e);
        }),
        appBar: AppBar(
          title: _selectedIndex == 1 ? Text("Score Card") : Text("Choose topic"),
        ),
        body: _selectedIndex == 1 ? ScoreCard() : ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: customButton(
                    comparedArray[index].category, context, buttonCallHandle,Colors.black),
              ),
            );
          },
          itemCount: comparedArray.length,
        ),
      ),
    );
  }
}
