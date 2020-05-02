import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  Animation<Color> animation;
  AnimationController controller;
  double height = 0;
  double opacity = 1;
  double heightCenter = 0;
  double centerOpacity = 0;
  double imageCenterIconHeight = 0;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds:2), vsync: this);
    animation =
    ColorTween(begin: Colors.grey, end: Colors.white).animate(controller)
      ..addListener(() {
        setState(() {
          if(height > MediaQuery.of(context).size.width/1.2) {
            centerOpacity += centerOpacity >=1 ? 1 : 0.015;
            heightCenter = heightCenter >= 100 ? 100 : heightCenter += 2;
            imageCenterIconHeight += 0.5;
          }
          height = height < MediaQuery.of(context).size.height ? height+20 : MediaQuery.of(context).size.height;
          opacity -= opacity <=0 ? 0 : 0.01;
          // The state that has changed here is the animation object’s value.
        });
      });
    animateColor();
  }
  bool buttonToggle = true;

  void animateColor() {
    if (buttonToggle) {
      controller.forward();
    } else {
      controller.reverse();
    }
    buttonToggle = !buttonToggle;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: animation.value,
        body: Stack(
          children: <Widget>[
            Container(
        alignment: Alignment.topLeft,
              color: Colors.deepPurpleAccent.withOpacity(opacity),
              width: height/2,
              height: height,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                color: Colors.blueAccent.withOpacity(opacity),
                width: height/2,
                height: height,
              ),
            ),
            Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                    color: Colors.grey[800].withOpacity(centerOpacity),
                  ),
                  alignment: Alignment.center,
                  width: heightCenter,
                  height: heightCenter,
                  child: IconButton(icon: Icon(Icons.home,size: imageCenterIconHeight,color: Colors.limeAccent,), onPressed: (){
                    Navigator.pushReplacementNamed(context, '/choice');
                    print('tap');
                  })
              ),
            ),
          ],
        ),
      ),
    );
  }
}
