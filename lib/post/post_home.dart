import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:session17/post/post_model/model.dart';

class PostHome extends StatefulWidget {
  const PostHome({super.key});

  @override
  State<PostHome> createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  late Future<Post> postData;

  @override
  void initState() {
    super.initState();
    postData = getData();
  }

  Future<Post> getData() async {
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception("the data don't load ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Home"),
      ),
      body: Center(
        child: FutureBuilder(
            future: postData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.id.toString()),
                    Text(snapshot.data!.userId.toString()),
                    Text(snapshot.data!.title),
                    Text(snapshot.data!.body)
                  ],
                );
              } else if (snapshot.hasError) {
                throw Exception("no data load");
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
