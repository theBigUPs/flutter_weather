import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/web_api.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
//TODO this can apparently be done in a better way
void setUpServiceAdapter() {
  getIt.registerLazySingleton<WebApi>(() => OpenWeatherApi());
  getIt.registerLazySingleton<LocalStorage>(() => SharedPrefStorage());
}
