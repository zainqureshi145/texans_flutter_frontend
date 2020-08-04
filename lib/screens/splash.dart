import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_ui_kit/screens/join.dart';
import 'package:restaurant_ui_kit/screens/walkthrough.dart';
import 'package:restaurant_ui_kit/util/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restaurant_ui_kit/screens/categories_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeout() {
    return Timer(Duration(seconds: 3), changeScreen);
  }
  //TODO: Here comes the code which controls the logic of Walkthrough Page

  changeScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.of(context).pushReplacement(
          //new MaterialPageRoute(builder: (context) => new JoinApp()));
          new MaterialPageRoute(builder: (context) => new CategoriesScreen()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Walkthrough()));
    }
//    Navigator.of(context).push(
//      MaterialPageRoute(
//        builder: (BuildContext context) {
//          return Walkthrough();
//        },
//      ),
//    );
//  }
  }

  //Backup
//  changeScreen() async {
//    Navigator.of(context).push(
//      MaterialPageRoute(
//        builder: (BuildContext context) {
//          return Walkthrough();
//        },
//      ),
//    );
//  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        margin: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
//              Icon(
//                Icons.fastfood,
//                size: 150.0,
//                color: Theme.of(context).accentColor,
//              ),
              Image(
                image: AssetImage('assets/logo/logo-2.png'),
                height: 120.0,
                width: 90.0,
              ),

              SizedBox(width: 40.0),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 15.0,
                ),
                child: Text(
                  "${Constants.appName}",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
