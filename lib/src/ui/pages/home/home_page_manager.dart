import 'package:flutter/foundation.dart';
import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';
import 'package:flutter_weather/src/services/web_api.dart';

class HomePageManager {
  HomePageManager({WebApi? webApi, LocalStorage? storage}) {
    _webApi = webApi ?? getIt<WebApi>();
    _storage = storage ?? getIt<LocalStorage>();
  }

  late WebApi _webApi;
  late LocalStorage _storage;

  final loadingNotifier = ValueNotifier<LoadingStatus>(const Loading());
  final temperatureNotifier = ValueNotifier<String>('');
  final buttonNotifier = ValueNotifier<String>('°C');

  late double _temperature;

  Future<void> loadWeather() async {
    loadingNotifier.value = const Loading();
    final isCelsius = _storage.isCelsius;
    buttonNotifier.value = isCelsius ? '°C' : '°F';



    try {
      final weather = await _webApi.getWeather(
        cityName: "istanbul",
      );
      _temperature = weather.main.temp;



      final temperature =
          isCelsius ? _temperature : _convertToFahrenheit(_temperature);
      temperatureNotifier.value = '$temperature°';
      loadingNotifier.value = LoadingSuccess(
        weather: weather.weather[0].main
      );
      // Now you have the weather data, and you can use it as needed
      //print('Temperature: ${weather.main.temp}');
      //print('Weather: ${weather.weather[0].main}');
    } catch (e) {
      print(e);
      loadingNotifier.value = const LoadingError("Couldn't load the weather ");
    }
  }

  double _convertToFahrenheit(double temperature) {
    return (temperature * 9 / 5 + 32);
  }

  void convertTemperature() {
    final isCelsius = !_storage.isCelsius;
    _storage.saveIsCelsius(isCelsius);
    final temperature =
        (isCelsius) ? _temperature : _convertToFahrenheit(_temperature);
    temperatureNotifier.value = '$temperature°';
    buttonNotifier.value = (isCelsius) ? '°C' : '°F';
  }
}

sealed class LoadingStatus {
  const LoadingStatus();

  get message => null;
}

class Loading extends LoadingStatus {
  const Loading();
}

class LoadingError extends LoadingStatus {
  const LoadingError(this.message);
  @override
  final String message;
}

class LoadingSuccess extends LoadingStatus {
  const LoadingSuccess({
    required this.weather,
  });
  final String weather;
}
