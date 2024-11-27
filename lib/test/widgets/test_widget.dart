import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  String title;
  String body;
  PostWidget({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
       margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
        color: Colors.blueAccent
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(body)],
      ),
    );
  }
}
