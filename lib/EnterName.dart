import 'package:flutter/material.dart';

class EnterName extends StatefulWidget {
  @override
  _EnterNameState createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
  bool isButtonActive = false;
  String userName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Enter your name to continue..",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: "Enter your name"),
                onChanged: (text){
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
              SizedBox(height: 40,),
              FlatButton(
                color: !isButtonActive ? Colors.grey : Colors.deepOrange,
                onPressed: () {
                  if(!isButtonActive){
                    return null;
                  } else {
                    Navigator.of(context)
                        .pushReplacementNamed('/loading', arguments: userName);
                  }
                },
                child: Text("Continue...",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
