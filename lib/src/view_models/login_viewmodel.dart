import 'package:flutter/material.dart';
import 'package:flutter_weather/src/services/auth_service.dart';
import 'package:flutter_weather/src/services/routing_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';

class LoginViewModel with ChangeNotifier {
  final RoutingService _route;
  final Auth _auth;

  LoginViewModel({RoutingService? route, Auth? auth})
      : _route = route ?? getIt<RoutingService>(),
        _auth = auth ?? getIt<Auth>();

  void goToSignUp(BuildContext context) {
    _route.goToRegisterTab(context);
  }

  void logIn(String email, String password, BuildContext context) {
    _auth.loginUser(email, password).then((value) 
    {
      reDirect(context);
      notifyListeners();
    });
    
  }

  void reDirect(BuildContext context) {
    bool loggedOn = _auth.checkPresence();
    print(loggedOn);
    if (loggedOn) {
      _route.goToLogTab(context);
    } else {
      //_route.goToLogTab(context);
    }
  }
}
