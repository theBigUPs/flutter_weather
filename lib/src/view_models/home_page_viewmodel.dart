import 'package:flutter/foundation.dart';
import 'package:flutter_weather/src/models/weather_model.dart';
import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/location_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';
import 'package:flutter_weather/src/services/web_api.dart';

class HomePageViewModel with ChangeNotifier {
  final WebApi _webApi;
  final LocalStorage _storage;
  final _loc = getIt<LocationService>();

  HomePageViewModel({
    WebApi? webApi,
    LocalStorage? storage,
  })  : _webApi = webApi ?? getIt<WebApi>(),
        _storage = storage ?? getIt<LocalStorage>();

  Weather? mainweather;
  String temperature = '';
  String buttonUnit = '°C';
  String city = "";
  String dateTime = "";
  DateTime temp = DateTime.now();
  String imgState = "CLEAR";
  String? starterCity="";

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
      temp = DateTime.now();
      getDateTime();
      notifyListeners();
      return weather;
    } catch (e) {
      print(e);
    }
    return null;
  }

  void populateCities() {
    _storage.getCities().then((value) {
      cities = value;
      for (var element in cities) {
        loadWeatherWithCityName(cityName: element).then((name) => {
              cityiesWeather.add(name!),
            });
      }
    });
    notifyListeners();
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

  Future<Weather?> loadWeatherLatLon() async {
    dynamic latitude;
    dynamic longitude;
    
    try {
      final position = await _loc.determinePosition();

      // Handle the position data as needed
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      latitude = position.latitude;
      longitude = position.longitude;

      final weather = await _webApi.getWeatherLatLon(lat: latitude, lon: longitude);

      temp = DateTime.now();
      getDateTime();
      notifyListeners();
      return weather;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> getStartingCity ()async
  {
    
    starterCity = await _storage.getStarterCity();
    
    
  }
}
