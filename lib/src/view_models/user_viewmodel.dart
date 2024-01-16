import 'package:flutter/material.dart';
import 'package:flutter_weather/src/services/auth_service.dart';
import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/routing_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';

class UserViewModel with ChangeNotifier {
  final RoutingService _route;
  final Auth _auth;
  final LocalStorage _storage;

  bool switchValue = true;

  UserViewModel({RoutingService? route, Auth? auth, LocalStorage? storage})
      : _route = route ?? getIt<RoutingService>(),
        _auth = auth ?? getIt<Auth>(),
        _storage = storage ?? getIt<LocalStorage>();

  void toggleSwitch() {
    switchValue = !switchValue;
    notifyListeners();
  }

  void signOut(BuildContext context) {
    _auth.logOut().then((value) {
      _route.goToUserTab(context);
    });
  }

  void saveStartingCity(String city) {
    _storage.addStarterCity(city);
  }

  void saveLocationBool() {
    _storage.setIsLocationOn(switchValue);
    notifyListeners();
  }

  void getLocOn() {
    _storage.getIsLocationOn().then(
      (value) {
        switchValue = value ?? true;
        notifyListeners();
      },
    );
  }
}
