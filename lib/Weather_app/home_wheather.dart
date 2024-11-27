import 'package:flutter/material.dart';
import 'package:session17/Weather_app/weather_model/weather_model.dart';
import 'package:session17/Weather_app/weather_model/weather_service.dart';

class HomeWheather extends StatefulWidget {
  const HomeWheather({super.key});

  @override
  State<HomeWheather> createState() => _HomeWheatherState();
}

class _HomeWheatherState extends State<HomeWheather> {
  final TextEditingController controller = TextEditingController();
  WeatherService weatherService = WeatherService();
  WeatherModel? weatherModel;

  Future<void> getWeatherData(String city) async {
    try {
      final weather = await weatherService.getData(city);

      setState(() {
        weatherModel = weather;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffix: IconButton(
                      onPressed: () {
                        controller.clear();
                      },
                      icon: Icon(Icons.cancel),
                    )),
                onSubmitted: getWeatherData,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    getWeatherData(controller.text);
                  },
                  child: Text("data")),
              getWeatherWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget getWeatherWidget() {
    if (weatherModel != null) {
      return Column(
        children: [
          Text(
            weatherModel!.cityName,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            "${(weatherModel!.temprature - 273.15).toStringAsFixed(2)} C",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Image.network(
            "http://openweathermap.org/img/wn/${weatherModel!.weatherIcon}@2x.png",
            width: 100,
            height: 100,
          ),
          Text(
            weatherModel!.discraption,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ]
      );
    } else {
      return Text("no data found ");
    }
  }
}
