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
      body:  SafeArea(child: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          const Text("logged in"),
          ElevatedButton(
                onPressed: () {
                  UserViewModel viewModel =
                      Provider.of<UserViewModel>(context, listen: false);
                  viewModel.signOut(context);
                },
                child: const Text("log out"),),

          const Text("use location ?"),
          Consumer<UserViewModel>(
            builder: (context, viewModel, child) {
              return Switch(
                value: viewModel.switchValue,
                onChanged: (val) {
                viewModel.toggleSwitch(); // Call the method to update the switch value
                },
              );
            },
          ),
          Consumer<UserViewModel>(
            builder: (context, viewModel, child) {
              return Visibility(
                visible: viewModel.switchValue,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("select starting city:"),
                  const SizedBox(width: 200, child: TextField()),
                  ElevatedButton(onPressed: (){}, child: const Text("save city")),
                ],
              ));
            },
          ),
        ],
      )),
    );
  }
}
