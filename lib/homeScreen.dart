import 'package:flutter/material.dart';
import 'package:session17/navigator.dart';

class Homescreen extends StatelessWidget {
  static String routeName = 'home';
  String ScreenName = "the frist";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, NavigatorHome.routeName,
              arguments: ScreenNameArg(ScreenName));
        },
        child: Text("Go to Second Screen"),
      )),
    );
  }
}

class ScreenNameArg {
  String screenName;

  ScreenNameArg(this.screenName);
}
//backend 
void searchbyName(String name , int id ) {

}
