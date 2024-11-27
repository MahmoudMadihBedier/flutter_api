class WeatherModel {
  String cityName;
  double temprature;
  String discraption;
  String weatherIcon;

  WeatherModel({
    required this.cityName,
    required this.temprature,
    required this.discraption,
    required this.weatherIcon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cityName: json['name'],
        temprature: json['main']['temp'],
        discraption: json['weather'][0]['description'],
        weatherIcon: json['weather'][0]['icon']);
  }
}
