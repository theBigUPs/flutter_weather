import 'package:hive_flutter/hive_flutter.dart';

abstract interface class LocalStorage {
  Future<void> init();

  bool get isCelsius;
  Future<void> saveIsCelsius(bool value);
  Future<void> saveCities(List<String> value);
  Future<String> getCities();
}

//TODO this service should be modified to use hive or sqllite

class HiveStorage implements LocalStorage {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
  }

  Future<void> openbox(String boxname) async {
    await Hive.openBox(boxname);
  }

  @override
  bool get isCelsius {
    var celBox = Hive.box("celbox");
    // Use the get method to retrieve the value from the box
    // and return the parsed boolean value. If the key is not present,
    // return a default value (false in this case).
    return celBox.get("iscel", defaultValue: false) == "true";
  }

  @override
  Future<void> saveIsCelsius(bool value) async {
    var celBox = await Hive.openBox("celbox");
    celBox.put("iscel", "$value");
  }

  @override
  Future<void> saveCities(List<String> value) async {
    var celBox = await Hive.openBox("citybox");

    // Store the list of cities directly in the box without converting it to a string
    celBox.put("cities", value);
  }

  @override
  Future<String> getCities() async {
    var celOpenBox = await Hive.openBox("citybox");

    // Use the get method to retrieve the value (a list of cities) from the box.
    // If the key is not present or the value is not a list of strings, it returns null.
    return celOpenBox.get("cities");
  }
}
