import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget navbar() {
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
      padding: const EdgeInsets.symmetric(
          horizontal: 14, vertical: 15), // navigation bar padding
      tabs: const [
        GButton(
          margin: EdgeInsets.fromLTRB(32, 0, 0, 0),
          icon: Icons.home,
          text: '',
        ),
        GButton(
          icon: Icons.search,
          text: '',
        ),
        GButton(
          icon: Icons.person,
          text: '',
        ),
        GButton(
          margin: EdgeInsets.fromLTRB(0, 0, 32, 0),
          icon: Icons.notifications,
          text: '',
        )
      ]);
}
