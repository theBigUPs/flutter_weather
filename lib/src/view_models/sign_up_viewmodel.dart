import 'package:flutter/material.dart';
import 'package:flutter_weather/src/services/auth_service.dart';
import 'package:flutter_weather/src/services/routing_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';

class SignUpViewModel with ChangeNotifier {
  final RoutingService _route;
   final Auth _auth;

  SignUpViewModel({RoutingService? route,Auth? auth})
      : _route = route ?? getIt<RoutingService>(),
       _auth = auth ?? getIt<Auth>();

  void goToSignUp(BuildContext context) {
    _route.goToUserTab(context);
  }
  void registerUser(String email,String password,BuildContext context)
  {
    _auth.signUpUser(email, password).then
    ((value)
    {
      if(value)
      {
        _route.goToLogTab(context);
      }
      else
      {
        
      }
    });
  }
}
