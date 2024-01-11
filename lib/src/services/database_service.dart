import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class DatabaseService {
  Future<void> saveUserSettings(List<String> cities,String userid);
  Future<void> getUserSettings();
  Future<void> deleteUserSettings();

}

class FirebaseDatabaseService implements DatabaseService 
{
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  @override
  Future<void> deleteUserSettings() {
    // TODO: implement deleteUserSettings
    throw UnimplementedError();
  }

  

  @override
  Future<void> getUserSettings() {
    // TODO: implement getUserSettings
    throw UnimplementedError();
  }


  @override
  Future<void> saveUserSettings(List<String> cities,String userid) async{
    await _store.collection("user_settings").doc(userid).set({"citylist":cities});
  }

}