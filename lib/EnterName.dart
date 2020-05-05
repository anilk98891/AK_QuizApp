import 'package:anilquizapp/CustomFunctions/CustomAlerts.dart';
import 'package:flutter/material.dart';

class EnterName extends StatefulWidget {
  @override
  _EnterNameState createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
  bool isButtonActive = false;
  String userName = "";
  dynamic objectPush;

  navigateToQuiz() async {
    Navigator.of(context).pushReplacementNamed('/quiz',
        arguments: {"data": objectPush, "name": userName});
  }

  @override
  Widget build(BuildContext context) {
    objectPush = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Enter your name to continue..",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: "Enter your name"),
                onChanged: (text) {
                  if (text.isEmpty) {
                    setState(() {
                      isButtonActive = false;
                    });
                  } else {
                    setState(() {
                      userName = text;
                      isButtonActive = true;
                    });
                  }
                  return text;
                },
                validator: (text) {
                  if (text.isEmpty) {
                    setState(() {
                      isButtonActive = false;
                    });
                  } else {
                    setState(() {
                      userName = text;
                      isButtonActive = true;
                    });
                  }
                  return text;
                },
                autofocus: true,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 80,
                width: 180,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(4, 3),
                        color: Colors.black)
                  ],
                  color: !isButtonActive ? Colors.grey : Colors.deepOrange,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: InkWell(
                  onTap: () {
                    if (!isButtonActive) {
                      return null;
                    } else {
                      if (objectPush.length > 0) {
                        navigateToQuiz();
                      } else {
                        CustomAlert().showAlertDialogWithOkButton(
                            context, "No data Found!!", "Sorry", "Ok", () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      }
                    }
                  },
                  child: Text("Continue...",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
