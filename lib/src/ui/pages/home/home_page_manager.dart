import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';
import 'package:flutter_weather/src/services/web_api.dart';
import 'package:mobx/mobx.dart';

part 'home_page_manager.g.dart';

class HomePageManager = _HomePageManager with _$HomePageManager;

abstract class _HomePageManager with Store {
  final WebApi _webApi;
  final LocalStorage _storage;

  _HomePageManager({WebApi? webApi, LocalStorage? storage})
      : _webApi = webApi ?? getIt<WebApi>(),
        _storage = storage ?? getIt<LocalStorage>();

  @observable
  String temperature = '';

  @observable
  String buttonUnit = '°C';

  @observable
  double _temperature = 0.0;

  @observable
  String city = "";

  @observable
  String desc = "";

  @action
  Future<void> loadWeatherWithCityName({required String cityName}) async {
    city = cityName;
    try {
      final weather = await _webApi.getWeather(
        cityName: cityName,
      );
      _temperature = weather.main.temp;
      temperature = _temperature.toString();
      desc = weather.weather[0].description;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> loadWeatherLatLon(
      {required double latitude, required double longtitude}) async {
    try {
      final weather =
          await _webApi.getWeatherLatLon(lat: latitude, lon: longtitude);
      _temperature = weather.main.temp;
      temperature = _temperature.toString();
      desc = weather.weather[0].description;
      city = weather.name;
    } catch (e) {
      print(e);
    }
  }
}
