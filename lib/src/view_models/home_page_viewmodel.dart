import 'package:flutter/foundation.dart';
import 'package:flutter_weather/src/models/weather_model.dart';
import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/routing_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';
import 'package:flutter_weather/src/services/web_api.dart';

class HomePageViewModel with ChangeNotifier {
  final WebApi _webApi;
  final LocalStorage _storage;
  final RoutingService _rout;

  HomePageViewModel(
      {WebApi? webApi, LocalStorage? storage, RoutingService? route})
      : _webApi = webApi ?? getIt<WebApi>(),
        _storage = storage ?? getIt<LocalStorage>(),
        _rout = route ?? getIt<RoutingService>();

  String temperature = '';
  String buttonUnit = '°C';
  final double _temperature = 0.0;
  String city = "";
  String desc = "";
  String dateTime = "";
  String high = "";
  String low = "";
  String feels = "";
  String imgState = "CLEAR";

  //Weather? weather;
  List<String> cities = [
    "new york",
    "sydney",
  ];
  List<Weather> cityiesWeather = [];

  Future<Weather?> loadWeatherWithCityName({required String cityName}) async {
    city = cityName;
    try {
      Weather weather = await _webApi.getWeather(
        cityName: cityName,
      );

      getDateTime();
      notifyListeners();
      return weather;
    } catch (e) {
      print(e);
    }
    return null;
  }

  void notify() {
    notifyListeners();
    //TODO THIS IS BAD
  }

  void populateCities() {
    for (var element in cities) {
      loadWeatherWithCityName(cityName: element).then((value) => {
            cityiesWeather.add(value!),
            //notify(),
            notifyListeners(),
          });
    }
  }

  String weekDay(int dayNum) {
    switch (dayNum) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
    }
    return "";
  }

  void getDateTime() {
    DateTime now = DateTime.now();
    String min = now.minute.toString();
    int dayName = now.weekday;
    dateTime =
        "${weekDay(dayName)}, ${now.day}/${now.month}/${now.year} | ${now.hour}:${min.length == 1 ? "0$min" : min}";
  }

  Future<void> loadWeatherLatLon(
      {required double latitude, required double longtitude}) async {
    try {
      final weather =
          await _webApi.getWeatherLatLon(lat: latitude, lon: longtitude);
      //_temperature = weather.main.temp;
      temperature = _temperature.toString();
      //desc = weather.weather[0].description;
      //city = weather.name;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
