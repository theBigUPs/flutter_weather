import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CitiesViewModel with ChangeNotifier {
  List<String> cities = [];
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
      print('Error reading file: $e');
      return ["not available"];
    }
  }

  void updateList(String contains) {
    result = cities.where((city) => city.contains(contains)).toList();
    notifyListeners();
  }
}
