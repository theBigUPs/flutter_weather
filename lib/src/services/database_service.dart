import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class DatabaseService {
  Future<void> saveUserSettings(List<String> cities, String userid,
      String startingCity, bool isCelsius, bool isLocationOn);
  Future<void> getUserSettings(String userid);
  Future<void> deleteUserSettings(String userid);
}

class FirebaseDatabaseService implements DatabaseService {
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  @override
  Future<void> deleteUserSettings(String userid) async {
    await _store.collection("user_settings").doc(userid).delete();
  }

  @override
  Future<void> getUserSettings(String userid) async {
    await _store.collection("user_settings").doc(userid).get();
  }

  @override
  Future<void> saveUserSettings(List<String> cities, String userid,
      String startingCity, bool isCelsius, bool isLocationOn) async {
    await _store.collection("user_settings").doc(userid).set({
      "citylist": cities,
      "startingcity": startingCity,
      "iscelsius": isCelsius,
      "islocationon": isLocationOn
    });
  }
}
