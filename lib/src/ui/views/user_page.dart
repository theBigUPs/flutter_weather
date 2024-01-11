import 'package:flutter/material.dart';
import 'package:flutter_weather/src/ui/components/navbar.dart';
import 'package:flutter_weather/src/view_models/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: navbar(context, 2),
      body:  SafeArea(child: Column(
        children: [
          const Text("logged in"),
          ElevatedButton(
                onPressed: () {
                  UserViewModel viewModel =
                      Provider.of<UserViewModel>(context, listen: false);
                  viewModel.signOut(context);
                },
                child: const Text("log out"),)
        ],
      )),
    );
  }
}
