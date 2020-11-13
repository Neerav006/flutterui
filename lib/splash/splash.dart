import 'dart:async';

import 'package:counter_app/const/app_constant.dart';
import 'package:counter_app/home.dart';
import 'package:counter_app/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {

  final splashDelay = 3;
  SharedPreferences sharedPreferences;
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    AppConstant.getPrefrence().then((value) {
      this.sharedPreferences = value;
      _loadWidget();
    });

    animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener((){
         setState(() {

         });
    });
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animationController.reverse();
      } else if(status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              color: Colors.deepPurple,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset("images/flutter_logo.png",width: animation.value*200,height: animation.value*100,)
            )

          ],
      ),
    );
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  // Navigate to next screen after splash
  void navigationPage() {
     bool isLogIn =  sharedPreferences.getBool(AppConstant.PREF_IS_LOGIN)??false;
     if(isLogIn){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
     }
     else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPageState(),));
     }
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

}
