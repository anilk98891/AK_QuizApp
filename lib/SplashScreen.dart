import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  Animation<Color> animation;
  AnimationController controller;
  double height = 100;
  double opacity = 1;
  double heightCenter = 0;
  double centerOpacity = 0;
  double imageCenterIconHeight = 0;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds:3), vsync: this);
    animation =
    ColorTween(begin: Colors.red, end: Colors.lime).animate(controller)
      ..addListener(() {
        setState(() {
          if(height > MediaQuery.of(context).size.width/1.2) {
            centerOpacity += centerOpacity >=1 ? 1 : 0.005;
            heightCenter = heightCenter >= 150 ? 150 : heightCenter += 1;
            imageCenterIconHeight += 0.3;
          }
          height += 4;
          opacity -= opacity <=0 ? 0 : 0.005;
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
              color: Colors.white.withOpacity(opacity),
              width: height/2,
              height: height,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                color: Colors.black.withOpacity(opacity),
                width: height/2,
                height: height,
              ),
            ),
            Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                    color: Colors.indigo.withOpacity(centerOpacity),
                  ),
                  alignment: Alignment.center,
                  width: heightCenter,
                  height: heightCenter,
                  child: IconButton(icon: Icon(Icons.home,size: imageCenterIconHeight,), onPressed: (){
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
