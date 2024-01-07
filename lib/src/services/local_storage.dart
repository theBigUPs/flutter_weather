import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalStorage {
  Future<void> init();

  bool get isCelsius;
  Future<void> saveIsCelsius(bool value);
}

class SharedPrefStorage implements LocalStorage {
  static const isCelsiusKey = "isCelcius";
  static const latitudeKey = "isLatitude";
  static const longtitudeKey = "isLongtitude";
  static const cityListKey = "cityList";

  late SharedPreferences prefs;

  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  bool get isCelsius => prefs.getBool(isCelsiusKey) ?? true;

  @override
  Future<void> saveIsCelsius(bool value) async {
    await prefs.setBool(isCelsiusKey, value);
  }

  
}
