import 'package:flutter/material.dart';
import 'package:flutter_weather/src/services/location_service.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';
import 'package:flutter_weather/src/ui/components/navbar.dart';
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
    //HomePageViewModel viewModel = Provider.of(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomePageViewModel viewModel = Provider.of(
        context,
        listen: false,
      );

      // viewModel.loadWeatherWithCityName(cityName: "istanbul").then((value) {
      //   mainweather = value;

      //   viewModel.notify();
      // });
      //viewModel.populateCities();
    });
    return Scaffold(
      bottomNavigationBar: navbar(context, 0),
      appBar: AppBar(
        backgroundColor: const Color(0xff28227f),
        centerTitle: true,
        title: Consumer<HomePageViewModel>(
          builder: (context, viewModel, child) {
            return Text(
              viewModel.mainweather?.city.name ?? "",
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
                viewModel
                    .loadWeatherWithCityName(cityName: "istanbul")
                    .then((value) {
                  viewModel.mainweather = value;
                  viewModel.populateCities();
                });

                //viewModel.notify();
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
          child: ListView(children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Consumer<HomePageViewModel>(
                  builder: (context, viewModel, child) {
                    return Text(
                      viewModel.mainweather?.list[0].weather[0].description ??
                          "",
                      style: const TextStyle(color: Colors.white),
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    height: 150,
                    child: Consumer<HomePageViewModel>(
                        builder: (context, viewModel, child) {
                      return Image.asset(
                        "assets/images/${viewModel.mainweather?.list[0].weather[0].main.name ?? "CLEAR"}.png",
                        fit: BoxFit.fitHeight,
                      );
                    })),
                Consumer<HomePageViewModel>(
                  builder: (context, viewModel, child) {
                    return Text(
                      " ${viewModel.mainweather?.list[0].main.temp ?? ""}°",
                      style: const TextStyle(color: Colors.white, fontSize: 64),
                    );
                  },
                ),
                Consumer<HomePageViewModel>(
                    builder: (context, viewModel, child) {
                  return Text(
                    viewModel.dateTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Card(
                    color: const Color(0x776148a3),
                    child: SizedBox(
                      width: 300,
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Consumer<HomePageViewModel>(
                              builder: (context, viewModel, child) {
                            return customCard(
                                "high",
                                viewModel.mainweather?.list[0].main.tempMax
                                        .toString() ??
                                    "",
                                const Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                ));
                          }),
                          Consumer<HomePageViewModel>(
                              builder: (context, viewModel, child) {
                            return customCard(
                                "low",
                                viewModel.mainweather?.list[0].main.tempMin
                                        .toString() ??
                                    "",
                                const Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ));
                          }),
                          Consumer<HomePageViewModel>(
                              builder: (context, viewModel, child) {
                            return customCard(
                                "feels like",
                                viewModel.mainweather?.list[0].main.feelsLike
                                        .toString() ??
                                    "",
                                const Icon(
                                  Icons.heart_broken,
                                  color: Colors.white,
                                ));
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 120,
                  //width: 100,
                  child: Consumer<HomePageViewModel>(
                    builder: (context, viewModel, child) => ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.mainweather?.list.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        //int originalIndex = index * 4;
                        //

                        if (viewModel.temp.day <
                            viewModel.mainweather!.list[index].dtTxt.day) {
                          viewModel.temp =
                              viewModel.mainweather!.list[index].dtTxt;
                          return customWeatherCard(
                            viewModel.mainweather!.list[index].main.temp
                                .toString(),
                            viewModel
                                .mainweather!.list[index].weather[0].main.name,
                            viewModel.weekDay(viewModel
                                .mainweather!.list[index].dtTxt.weekday),
                          );
                        } else {
                          //temp = DateTime.now();
                          return Container(
                              //child: const Text("no weather service or internet"),
                              );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 120,
                  //width: 100,
                  child: Consumer<HomePageViewModel>(
                    builder: (context, viewModel, child) => ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: (viewModel.cities.isEmpty)
                          ? 0
                          : viewModel.cities.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index >= viewModel.cityiesWeather.length) {
                          // Handle the case when either cities or cityiesWeather is empty
                          return Container();
                        }

                        return customCityWeatherCard(
                          viewModel.cityiesWeather[index].list[0].main.temp
                              .toString(),
                          viewModel.cityiesWeather[index].list[0].weather[0]
                              .main.name,
                          viewModel.cityiesWeather[index].city.name,
                          viewModel.cityiesWeather[index].list[0].weather[0]
                              .description,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget customCard(String text, String temp, Icon i) {
    return SizedBox(
      width: 60,
      height: 70,
      child: Column(
        children: [
          i,
          Text(
            temp,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget customWeatherCard(String temp, String pic, String day) {
    return Card(
      color: const Color(0x776148a3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 29,
            width: 110,
            child: Image.asset(
              "assets/images/$pic.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            temp,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            day,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget customCityWeatherCard(
      String temp, String pic, String name, String status) {
    return Card(
      color: const Color(0x776148a3),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 70,
            child: Image.asset(
              "assets/images/$pic.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  status,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 50,
            child: Text(
              temp,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
