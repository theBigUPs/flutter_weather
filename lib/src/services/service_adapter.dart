import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/location_service.dart';
import 'package:flutter_weather/src/services/web_api.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpServiceAdapter() {
  getIt.registerLazySingleton<WebApi>(() => OpenWeatherApi());
  getIt.registerLazySingleton<LocalStorage>(() => SharedPrefStorage());
  getIt.registerLazySingleton<LocationService>(() => GeoLocator());
}
