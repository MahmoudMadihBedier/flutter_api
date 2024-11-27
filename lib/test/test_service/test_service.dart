import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:session17/test/test_model/test_model.dart';

class TestService {
  final String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<TestModel>> fetchData() async {
    http.Response  response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
     final data = json.decode(response.body) ;
     final List<dynamic> postsList=data;
      return  postsList.map((json) => TestModel.fromJson(json)).toList();
    } else {
      throw Exception("no data load");
    }
  }
}
