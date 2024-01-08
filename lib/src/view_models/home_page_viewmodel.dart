import 'package:flutter/foundation.dart';
import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';
import 'package:flutter_weather/src/services/web_api.dart';

class HomePageViewModel with ChangeNotifier {
  final WebApi _webApi;
  final LocalStorage _storage;

  HomePageViewModel({WebApi? webApi, LocalStorage? storage})
      : _webApi = webApi ?? getIt<WebApi>(),
        _storage = storage ?? getIt<LocalStorage>();

  String temperature = '';
  String buttonUnit = '°C';
  double _temperature = 0.0;
  String city = "";
  String desc = "";
  String dateTime = "";

  Future<void> loadWeatherWithCityName({required String cityName}) async {
    city = cityName;
    try {
      final weather = await _webApi.getWeather(
        cityName: cityName,
      );
      _temperature = weather.main.temp;
      temperature = _temperature.toInt().toString();
      desc = weather.weather[0].description;
      getDateTime();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void getDateTime() {
    DateTime now = DateTime.now();

    dateTime =
        "${now.day}/${now.month}/${now.year} | ${now.hour}:${now.minute}";
  }

  Future<void> loadWeatherLatLon(
      {required double latitude, required double longtitude}) async {
    try {
      final weather =
          await _webApi.getWeatherLatLon(lat: latitude, lon: longtitude);
      _temperature = weather.main.temp;
      temperature = _temperature.toString();
      desc = weather.weather[0].description;
      city = weather.name;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
