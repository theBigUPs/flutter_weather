import 'package:flutter/material.dart';
import 'package:flutter_weather/src/services/location_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';
import 'package:flutter_weather/src/view_models/home_page_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _loc = getIt<LocationService>();
  //final store = getIt<LocalStorage>();
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
        
        Consumer<HomePageViewModel>(builder:(context,viewModel,child)
        {
          return Text(viewModel.city);
        }),
        
        Consumer<HomePageViewModel>(builder:(context,viewModel,child)
        {
          return Text(viewModel.temperature);
        } ),
        Consumer<HomePageViewModel>(builder:(context,viewModel,child)
        {
          return Text(viewModel.desc);
        } ),
        TextButton(

            onPressed: () {
              HomePageViewModel viewModel = Provider.of(context,listen: false);
              //viewModel.loadWeatherLatLon(latitude: 40.73, longtitude: -73.93);
              // Call the determinePosition method when the button is pressed
              _loc.determinePosition().then((position) {
                // Handle the position data as needed
                print(
                    'Latitude: ${position.latitude}, Longitude: ${position.longitude}');

                viewModel.loadWeatherLatLon(
                    latitude: position.latitude,
                    longtitude: position.longitude);
              }).catchError((error) {
                // Handle errors if any
                print('Error: $error');
              });
              // String cities = await store.getCities();
              // List<String> stringList = cities
              //     .replaceAll('[', '')
              //     .replaceAll(']', '')
              //     .split(',')
              //     .map((e) => e.trim())
              //     .toList();
              // print(stringList);
            },
            child: const Text("refresh"))
      ]),
    );
  }
}
