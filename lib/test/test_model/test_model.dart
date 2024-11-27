import 'package:flutter/material.dart';

class TestModel {
  int id;
  int userId;
  String title;
  String body;

  TestModel({
   required this.id, 
   required this.userId, 
   required  this.title,
  required this.body});

factory TestModel.fromJson( Map<String ,dynamic> json){ 
  return TestModel(
    body:json['body'], 
    id:json['id'], 
    userId: json['userId'],
    title: json['title'],
    );}
}
