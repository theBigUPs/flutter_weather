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
    HomePageViewModel viewModel = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff28227f),
        centerTitle: true,
        title: Consumer<HomePageViewModel>(
          builder: (context, viewModel, child) {
            return Text(
              viewModel.city,
              style: const TextStyle(color: Colors.white),
            );
          },
        ),
        actions: [
          IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                HomePageViewModel viewModel =
                    Provider.of(context, listen: false);
                viewModel.loadWeatherWithCityName(cityName: "istanbul");
                //viewModel.loadWeatherLatLon(latitude: 40.73, longtitude: -73.93);
                // Call the determinePosition method when the button is pressed

                // _loc.determinePosition().then((position) {
                //   // Handle the position data as needed
                //   print(
                //       'Latitude: ${position.latitude}, Longitude: ${position.longitude}');

                //   viewModel.loadWeatherLatLon(
                //       latitude: position.latitude,
                //       longtitude: position.longitude);
                // }).catchError((error) {
                //   showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return const AlertDialog(
                //           title: Text("Please enable location Services"),
                //         );
                //       });
                //   // Handle errors if any
                //   print('Error: $error');
                // });
                // String cities = await store.getCities();
                // List<String> stringList = cities
                //     .replaceAll('[', '')
                //     .replaceAll(']', '')
                //     .split(',')
                //     .map((e) => e.trim())
                //     .toList();
                // print(stringList);
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
      ),
      //backgroundColor: const Color(0xff28227f),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff441c50), Color(0xff28227f)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<HomePageViewModel>(
                builder: (context, viewModel, child) {
                  return Text(
                    viewModel.desc,
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
              const Image(
                image: AssetImage("assets/images/weathericonsunnycloudy.png"),
              ),
              Consumer<HomePageViewModel>(
                builder: (context, viewModel, child) {
                  return Text(
                    " ${viewModel.temperature}°",
                    style: const TextStyle(color: Colors.white, fontSize: 64),
                  );
                },
              ),
              Consumer<HomePageViewModel>(builder: (context, viewModel, child) {
                return Text(
                  viewModel.dateTime,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                );
              }),
              Center(
                child: Card(
                  color: const Color(0x776148a3),
                  child: SizedBox(
                    width: 300,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customCard("text"),
                        const Text(
                          "low",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "feels like",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "today",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "5-day Forecast",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 50,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 160,
                      color: Colors.red,
                    ),
                    Container(
                      width: 160,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 160,
                      color: Colors.green,
                    ),
                    Container(
                      width: 160,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 160,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Other Cities",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 160,
                      color: Colors.red,
                    ),
                    Container(
                      width: 160,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 160,
                      color: Colors.green,
                    ),
                    Container(
                      width: 160,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 160,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              //bottomnavbar
            ],
          ),
        ),
      ),
    );
  }

  Widget customCard(String text) {
    return SizedBox(
      width: 45,
      height: 45,
      child: Column(
        children: [
          const Icon(
            Icons.abc,
            color: Colors.white,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
