import 'package:flutter/material.dart';
import 'package:flutter_weather/src/services/auth_service.dart';
import 'package:flutter_weather/src/services/routing_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget navbar(BuildContext context, int index) {
  return GNav(
      backgroundColor: const Color(0xff441c50),
      rippleColor:
          const Color(0xff441c50), // tab button ripple color when pressed
      hoverColor: const Color(0xff441c50), // tab button hover color
      haptic: true, // haptic feedback
      tabBorderRadius: 100,
      tabActiveBorder: Border.all(
          color: const Color(0xff441c50), width: 1), // tab button border
      // tabBorder: Border.all(
      //     color: const Color(0xff51326f), width: 1), // tab button border
      // tabShadow: [
      //   BoxShadow(
      //       color: const Color(0xff51326f).withOpacity(1), blurRadius: 8)
      // ], // tab button shadow
      curve: Curves.easeOutExpo, // tab animation curves
      duration: const Duration(milliseconds: 0), // tab animation duration
      gap: 8, // the tab button gap between icon and text
      color: const Color(0xffffffff), // unselected icon color
      activeColor: Colors.white, // selected icon and text color
      iconSize: 20, // tab button icon size
      tabBackgroundColor:
          const Color(0xff634386), // selected tab background color
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      selectedIndex: index,
      tabs: [
        GButton(
          margin: const EdgeInsets.fromLTRB(32, 0, 0, 0),
          icon: Icons.home,
          text: '',
          onPressed: () {
            RoutingService rout = getIt<RoutingService>();
            rout.goToHomeTab(context);
          },
        ),
        GButton(
          icon: Icons.search,
          text: '',
          onPressed: () {
            RoutingService rout = getIt<RoutingService>();
            rout.goToCitiesTab(context);
          },
        ),
        GButton(
          margin: const EdgeInsets.fromLTRB(0, 0, 32, 0),
          icon: Icons.person,
          text: '',
          onPressed: () {
            RoutingService rout = getIt<RoutingService>();
            Auth auth = getIt<Auth>();
            auth.checkPresence()
                ? rout.goToLogTab(context)
                : rout.goToUserTab(context);
          },
        ),
      ]);
}
