import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_weather/src/services/location_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';

import 'home_page_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final manager = HomePageManager();
  final _loc = getIt<LocationService>();
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
              // Call the determinePosition method when the button is pressed
              _loc.determinePosition().then((position) {
                // Handle the position data as needed
                print(
                    'Latitude: ${position.latitude}, Longitude: ${position.longitude}');
              }).catchError((error) {
                // Handle errors if any
                print('Error: $error');
              });
            },
            child: const Text("refresh"))
      ]),
    );
  }
}
