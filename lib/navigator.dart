import 'package:flutter/material.dart';
import 'package:session17/homeScreen.dart';

class NavigatorHome extends StatelessWidget {
  static const String  routeName = 'navigator';

  @override
  Widget build(BuildContext context) {
   ScreenNameArg  arg = ModalRoute.of(context)?.settings.arguments as ScreenNameArg;
    return Scaffold(
      body: Center(child: Text(arg.screenName),),
    );
  }
}