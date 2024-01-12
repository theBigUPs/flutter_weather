import 'dart:convert';

import 'package:flutter_weather/src/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract interface class WebApi {
  Future<Weather> getWeather({required String cityName});

  Future<Weather> getWeatherLatLon({required double lat, required double lon});
}
//2e25b2bfc703c1d877cae76e2026a7cd   key

class OpenWeatherApi implements WebApi {
  //final String apiKey;

  OpenWeatherApi();

  @override
  Future<Weather> getWeather({required String cityName}) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=2e25b2bfc703c1d877cae76e2026a7cd&units=metric");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonMap = jsonDecode(response.body);
        final weather = Weather.fromJson(jsonMap);
        //print(weather);
        return weather;
      } else {
        // Handle error
        //print(response);
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      // Handle exceptions
      throw Exception('Error: $e');
    }
  }

  @override
  Future<Weather> getWeatherLatLon(
      {required double lat, required double lon}) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=2e25b2bfc703c1d877cae76e2026a7cd&units=metric');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonMap = jsonDecode(response.body);
        final weather = Weather.fromJson(jsonMap);
        //print(weather);
        return weather;
      } else {
        // Handle error
        //print(response);
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      // Handle exceptions
      throw Exception('Error: $e');
    }
  }
}
