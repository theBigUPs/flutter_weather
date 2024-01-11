import 'package:flutter/material.dart';
import 'package:flutter_weather/src/ui/components/navbar.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: navbar(context, 2),
      body: const SafeArea(child: Text("logged in")),
    );
  }
}
