import 'package:flutter/material.dart';
import 'package:flutter_weather/src/ui/components/navbar.dart';
import 'package:flutter_weather/src/view_models/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController city = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UserViewModel viewModel =
          Provider.of<UserViewModel>(context, listen: false);
      viewModel.getLocOn();
    });
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: navbar(context, 2),
      body: SafeArea(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("logged in"),
            ElevatedButton(
              onPressed: () {
                UserViewModel viewModel =
                    Provider.of<UserViewModel>(context, listen: false);
                viewModel.signOut(context);
              },
              child: const Text("log out"),
            ),
            const Text("use location ?"),
            Consumer<UserViewModel>(
              builder: (context, viewModel, child) {
                return Switch(
                  value: viewModel.switchValue,
                  onChanged: (val) {
                    viewModel.toggleSwitch();
                    viewModel.saveLocationBool();
                  },
                );
              },
            ),
            Consumer<UserViewModel>(
              builder: (context, viewModel, child) {
                return Visibility(
                  visible: !viewModel.switchValue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("select starting city:"),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: city,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            UserViewModel viewModel =
                                Provider.of<UserViewModel>(context,
                                    listen: false);
                            viewModel.saveStartingCity(city.text);
                          },
                          child: const Text("save city")),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
