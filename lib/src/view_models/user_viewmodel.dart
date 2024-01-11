import 'package:flutter/material.dart';
import 'package:flutter_weather/src/services/auth_service.dart';
import 'package:flutter_weather/src/services/routing_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';

class UserViewModel with ChangeNotifier {
  final RoutingService _route;
  final Auth _auth;

  UserViewModel({RoutingService? route, Auth? auth})
      : _route = route ?? getIt<RoutingService>(),
        _auth = auth ?? getIt<Auth>();
  void signOut(BuildContext context)
  {
    _auth.logOut();
    _route.goToUserTab(context);
  }
}
