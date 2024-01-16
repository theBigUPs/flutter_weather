import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalStorage {
  Future<void> init();

  bool get isCelsius;
  Future<void> saveIsCelsius(bool value);
  Future<void> saveCities(List<String> cities);
  Future<List<String>> getCities();
  void deleteCity(String city);
  void addCity(String city, BuildContext context);
  Future<void> addStarterCity(String city);
  Future<String?> getStarterCity();
}

class SharedPrefStorage implements LocalStorage {
  static const isCelsiusKey = "isCelcius";
  static const latitudeKey = "isLatitude";
  static const longtitudeKey = "isLongtitude";
  static const cityListKey = "cityList";
  static const startingCity = "beginningCity";

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

  @override
  Future<void> saveCities(List<String> cities) async {
    await prefs.setStringList(cityListKey, cities);
  }

  @override
  Future<List<String>> getCities() async {
    return prefs.getStringList(cityListKey) ?? [];
  }

  @override
  void deleteCity(String city) {
    List<String> cities;
    getCities().then((value) {
      cities = value;
      cities.remove(city);
      saveCities(cities);
    });
  }

  @override
  void addCity(String city, BuildContext context) {
    List<String> cities;
    getCities().then((value) {
      cities = value;
      cities.add(city);
      saveCities(cities);
    });
  }
  
  @override
  Future<void> addStarterCity(String city) async{
    await prefs.setString(startingCity, city);
  }
  
  @override
  Future<String?> getStarterCity() async{
    return prefs.getString(startingCity);
  }
}
