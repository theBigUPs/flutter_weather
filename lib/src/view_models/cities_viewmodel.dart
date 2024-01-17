import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/routing_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';

class CitiesViewModel with ChangeNotifier {
  final LocalStorage _storage;
  final RoutingService _route;
  CitiesViewModel({
    LocalStorage? storage,
    RoutingService? route,
  })  : _storage = storage ?? getIt<LocalStorage>(),
        _route = route ?? getIt<RoutingService>();

  List<String> citiesFromText = [];
  List<String> result = [];
  Future<List<String>> readItemsFromFile() async {
    try {
      // Use rootBundle to access files in the assets folder
      String fileContent =
          await rootBundle.loadString('assets/cities/cities.txt');

      // Split the content into lines
      List<String> lines = LineSplitter.split(fileContent).toList();
      lines = lines.map((line) => line.toLowerCase()).toList();
      return lines;
    } catch (e) {
      //print('Error reading file: $e');
      return ["not available"];
    }
  }

  void updateList(String contains) {
    result = citiesFromText.where((city) => city.contains(contains)).toList();
    notifyListeners();
  }

  void addCity(String city, BuildContext context) {
    _storage.addCity(city, context);
    _route.goToHomeTab(context);
  }

  void deleteCity(String city, BuildContext context) {
    _storage.deleteCity(city);
    _route.goToHomeTab(context);
  }
}
