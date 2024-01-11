import 'package:flutter/material.dart';
import 'package:flutter_weather/src/services/routing_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';

class SignUpViewModel with ChangeNotifier {
  final RoutingService _route;

  SignUpViewModel({RoutingService? route})
      : _route = route ?? getIt<RoutingService>();

  void goToSignUp(BuildContext context) {
    _route.goToUserTab(context);
  }
}
