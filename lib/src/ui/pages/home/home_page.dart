import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'home_page_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final manager = HomePageManager();

  @override
  void initState() {
    super.initState();
    manager.loadWeatherWithCityName(cityName: "istanbul");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Observer(
          builder: (context) {
            return Column(
              children: [
                Text(manager.city),
                Text(manager.temperature),
                Text(manager.desc),
              ],
            );
          },
        ),
        TextButton(
            onPressed: () {
              manager.loadWeatherWithCityName(cityName: "new york");
            },
            child: const Text("refresh"))
      ]),
    );
  }
}
