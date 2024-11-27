import 'dart:convert';

import 'package:session17/Weather_app/weather_model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final apiKey = 'fe6d820ff731844eb316a90f216cbc82';

  Future<WeatherModel> getData(String city) async {
    final http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}'));
    if (response.statusCode == 200) {
      final data =jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception("no data load ");
    }
  }
}
