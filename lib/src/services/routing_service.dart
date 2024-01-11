import 'package:flutter/material.dart';
import 'package:flutter_weather/src/ui/views/cities_page.dart';
import 'package:flutter_weather/src/ui/views/home_page.dart';
import 'package:flutter_weather/src/ui/views/login_page.dart';
import 'package:flutter_weather/src/ui/views/sign_in_page.dart';
import 'package:flutter_weather/src/ui/views/user_page.dart';
import 'package:flutter_weather/src/view_models/cities_viewmodel.dart';
import 'package:flutter_weather/src/view_models/home_page_viewmodel.dart';
import 'package:flutter_weather/src/view_models/login_viewmodel.dart';
import 'package:flutter_weather/src/view_models/sign_up_viewmodel.dart';
import 'package:flutter_weather/src/view_models/user_viewmodel.dart';
import 'package:provider/provider.dart';

abstract interface class RoutingService {
  void goToHomeTab(BuildContext context);
  void goToCitiesTab(BuildContext context);
  void goToUserTab(BuildContext context);
  void goToRegisterTab(BuildContext context);
  void goToLogTab(BuildContext context);
}

class TabBarRoutingService with ChangeNotifier implements RoutingService {
  @override
  void goToHomeTab(BuildContext context) {
    PageRouteBuilder newRoute = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return ChangeNotifierProvider(
          create: (context) {
            return HomePageViewModel();
          },
          child: const HomePage(),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Disable animations by returning the child directly
        return child;
      },
    );
    Navigator.pushReplacement(context, newRoute);
  }

  @override
  void goToCitiesTab(BuildContext context) {
    PageRouteBuilder newRoute = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return ChangeNotifierProvider(
          create: (context) {
            return CitiesViewModel();
          },
          child: const CitiesPage(),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Disable animations by returning the child directly
        return child;
      },
    );
    Navigator.pushReplacement(context, newRoute);
  }

  @override
  void goToUserTab(BuildContext context) {
    PageRouteBuilder newRoute = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return ChangeNotifierProvider(
          create: (context) {
            return LoginViewModel();
          },
          child: const LoginPage(),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Disable animations by returning the child directly
        return child;
      },
    );
    Navigator.pushReplacement(context, newRoute);
  }

  @override
  void goToRegisterTab(BuildContext context) {
    PageRouteBuilder newRoute = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return ChangeNotifierProvider(
          create: (context) {
            return SignUpViewModel();
          },
          child: const SignInPage(),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Disable animations by returning the child directly
        return child;
      },
    );
    Navigator.pushReplacement(context, newRoute);
  }

  @override
  void goToLogTab(BuildContext context) {
    PageRouteBuilder newRoute = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return ChangeNotifierProvider(
          create: (context) {
            return UserViewModel();
          },
          child: const UserPage(),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Disable animations by returning the child directly
        return child;
      },
    );
    Navigator.pushReplacement(context, newRoute);
  }
}
