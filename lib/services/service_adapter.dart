import 'package:flutter_weather/services/local_storage.dart';
import 'package:flutter_weather/services/web_api.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;

void setUpServiceAdapter()
{
  getIt.registerLazySingleton<WebApi>(() => FreeCodeCampApi());
  getIt.registerLazySingleton<LocalStorage>(() => SharedPrefStorage());
}