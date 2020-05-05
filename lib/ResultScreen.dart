import 'package:anilquizapp/CustomFunctions/CustomAlerts.dart';
import 'package:anilquizapp/Firebase/AuthFirebase.dart';
import 'package:anilquizapp/Firebase/FirebaseDatabase.dart';
import 'package:anilquizapp/Model/userScoreModel.dart';
import 'package:anilquizapp/ScreenLoader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int correctResult = 0;
  final AuthService _auth = AuthService();
  bool apiCalled = false;

  signInAnnoy() async {
    if(correctResult == 0){
      Navigator.pop(context);
      return;
    }
    _auth.signOut();
    dynamic user = await _auth.signInAnnOn();
    if (user != null) {
      await DataBaseService(uid: user.uid)
          .updateUserData('$correctResult', listScoreModel[0].userName);
      Navigator.pop(context);
    } else {
      CustomAlert().showAlertDialogWithOkButton(
          context, "Unable to save", "Error", "Ok", () {
        Navigator.pop(context);
        signInAnnoy();
      });
    }
  }

  updateCount() {
    correctResult = 0;
    setState(() {
      for (UserScoreModel i in listScoreModel) {
        if (i.answerGiven == i.answerActual) {
          correctResult += 1;
        }
      }
    });
  }

  Widget answerCorrect(index) {
    if (listScoreModel[index].answerGiven ==
        listScoreModel[index].answerActual) {
      return Icon(
        Icons.check_circle,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.cancel,
        color: Colors.pink,
      );
    }
  }

  List<UserScoreModel> listScoreModel;
  @override
  Widget build(BuildContext context) {
    listScoreModel = ModalRoute.of(context).settings.arguments;
    updateCount();
    return Scaffold(
      backgroundColor: Colors.black,
      body: apiCalled
          ? ScreenLoader()
          : Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: RichText(
                    text: new TextSpan(children: <TextSpan>[
                      new TextSpan(
                          text: 'Quiz ',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      new TextSpan(
                          text: 'Result', style: new TextStyle(fontSize: 20)),
                    ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 1,
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).size.height / 2.5,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                              text: new TextSpan(children: <TextSpan>[
                                new TextSpan(
                                    text: 'Question ',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                new TextSpan(
                                    text: '${index + 1} :',
                                    style: new TextStyle(fontSize: 25)),
                              ]),
                            ),
                            answerCorrect(index),
                          ],
                        ),
                      );
                    },
                    itemCount: listScoreModel.length,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: RichText(
                    text: new TextSpan(children: <TextSpan>[
                      new TextSpan(
                          text: 'Your Score: ',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      new TextSpan(
                          text: '$correctResult/${listScoreModel.length}',
                          style: new TextStyle(fontSize: 35)),
                    ]),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    apiCalled = true;
                    setState(() {});
                    signInAnnoy();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    width: 160,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo,
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          )
                        ]),
                    child: Container(
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
