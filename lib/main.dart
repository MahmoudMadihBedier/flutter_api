import 'package:flutter/material.dart';
import 'package:session17/Weather_app/home_wheather.dart';
import 'package:session17/homeScreen.dart';
import 'package:session17/navigator.dart';
import 'package:session17/post/post_home.dart';
import 'package:session17/test/home_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: HomeWheather(),
    );
  }
}
