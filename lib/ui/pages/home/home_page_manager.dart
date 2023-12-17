import 'package:flutter/foundation.dart';
import 'package:flutter_weather/services/local_storage.dart';
import 'package:flutter_weather/services/service_adapter.dart';
import 'package:flutter_weather/services/web_api.dart';

class HomePageManager{
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

  Future<void> loadWeather() async
  {
    loadingNotifier.value = const Loading();
    final isCelsius = _storage.isCelsius;
    buttonNotifier.value = isCelsius ? '°C' : '°F'; 
    try
    {
      final weather= await _webApi.getWeather(latitude: 41.0138, longitude: 28.9497);
      _temperature=weather.temp;

      final temperature= isCelsius ? _temperature : _convertToFahrenheit(_temperature);
      temperatureNotifier.value = '$temperature';
      loadingNotifier.value = LoadingSuccess(weather: weather.desc,);

    }
    catch(e)
    {
      loadingNotifier.value = const LoadingError("Couldn't load the weather");
    }
  }

  double _convertToFahrenheit(double temperature) {
    return (temperature * 9/5 + 32);
  }

  void convertTemperature() {
    final isCelsius = !_storage.isCelsius;
    _storage.saveIsCelsius(isCelsius);
    final temperature = (isCelsius) ? _temperature : _convertToFahrenheit(_temperature);
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