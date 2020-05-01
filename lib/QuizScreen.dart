import 'package:anilquizapp/Model/QuestionModel.dart';
import 'package:anilquizapp/Model/userScoreModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  int currentQuestionIndex = 1;
  String currentSelection = "";
  AnimationController controller;
  Animation<Offset> offset;
  int isNextClicked = 0;
  dynamic userData;
  List<QuestionModel> instance;
  List<UserScoreModel> scoreModelInstance = List<UserScoreModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller)
          ..addListener(() {
            isNextClicked++;
            setState(() {
              if (isNextClicked >= 2) {
                controller.reverse();
              }
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    userData = ModalRoute.of(context).settings.arguments;
    instance = userData["data"];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SlideTransition(
        position: offset,
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(40),
                  child: RichText(
                    text: new TextSpan(children: <TextSpan>[
                      new TextSpan(
                          text: 'Question $currentQuestionIndex/',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      new TextSpan(
                          text: '${instance.length}',
                          style: new TextStyle(fontSize: 20)),
                    ]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Text(instance[currentQuestionIndex - 1].question,
                      style: new TextStyle(fontSize: 20, color: Colors.white)),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      currentSelection = "a";
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      decoration: BoxDecoration(
                          color: currentSelection != "a"
                              ? Colors.black
                              : Colors.lightGreen,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigo,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            )
                          ]),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            currentSelection == "a"
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: currentSelection == "a"
                                ? Colors.white
                                : Colors.grey[200],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              instance[currentQuestionIndex - 1].option[0].text,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[200],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      currentSelection = "b";
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      decoration: BoxDecoration(
                          color: currentSelection != "b"
                              ? Colors.black
                              : Colors.lightGreen,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigo,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            )
                          ]),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            currentSelection == "b"
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: currentSelection == "b"
                                ? Colors.white
                                : Colors.grey[200],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              instance[currentQuestionIndex - 1].option[1].text,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[200],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      currentSelection = "c";
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      decoration: BoxDecoration(
                          color: currentSelection != "c"
                              ? Colors.black
                              : Colors.lightGreen,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigo,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            )
                          ]),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            currentSelection == "c"
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: currentSelection == "c"
                                ? Colors.white
                                : Colors.grey[200],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              instance[currentQuestionIndex - 1].option[2].text,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[200],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      currentSelection = "d";
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      decoration: BoxDecoration(
                          color: currentSelection != "d"
                              ? Colors.black
                              : Colors.lightGreen,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigo,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            )
                          ]),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            currentSelection == "d"
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: currentSelection == "d"
                                ? Colors.white
                                : Colors.grey[200],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              instance[currentQuestionIndex - 1].option[3].text,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[200],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Center(
                  child: FlatButton(
                    onPressed: () {
                      if (currentSelection != "") {
                        scoreModelInstance.add(new UserScoreModel(
                            userData["name"],
                            currentSelection,
                            instance[currentQuestionIndex-1].answer,
                            currentQuestionIndex));


                        if (currentQuestionIndex == instance.length) {
                          Navigator.pushReplacementNamed(context, '/result',
                              arguments: scoreModelInstance);
                        } else {
                          setState(() {
                            controller.forward();
                            isNextClicked = 0;
                            currentSelection = "";
                            currentQuestionIndex++;
                          });
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(left: 70, right: 70, top: 30),
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
                          'Next',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                          ),
                        )),
                    Positioned(
                      child: Container(
                        width: 20,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          color: Colors.limeAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 80,
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 80,
                      child: Container(
                        width: 18,
                        height: 18,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: SizedBox(
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 120,
                      child: Container(
                        width: 18,
                        height: 18,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: SizedBox(
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
