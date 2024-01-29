import 'package:flutter/material.dart';
import 'package:flutter_weather/src/ui/components/alert_dialog.dart';
import 'package:flutter_weather/src/ui/components/custom_cards.dart';
import 'package:flutter_weather/src/ui/components/navbar.dart';
import 'package:flutter_weather/src/view_models/home_page_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      HomePageViewModel viewModel = Provider.of(
        context,
        listen: false,
      );
      viewModel.getCelsius();
      await viewModel.getUseLocation() ?? true
          ? viewModel.loadWeatherLatLon().then((value) => {
                if (value == null)
                  {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alertDialog(context);
                      },
                    )
                  }
                else
                  {viewModel.mainweather = value},
              })
          : await viewModel.getStartingCity();
      viewModel.populateCities();
    });
  }

  @override
  void dispose() {
    // Dispose resources or perform cleanup when the widget is removed from the tree.
    WidgetsBinding.instance.removeObserver(this);
    //TODO put savetofirebase here
    //print("HOME PAGE DISPOSED");
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      //TODO put savetofirebase here as well
      //print("paused app on homepage");
    } else if (state == AppLifecycleState.resumed) {
      // App is in the foreground
    } else if (state == AppLifecycleState.detached) {
      //print("killed homepage");
    }
  }

  @override
  Widget build(BuildContext context) {
    HomePageViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    viewModel.temp = DateTime.now();

    return Scaffold(
      bottomNavigationBar: navbar(context, 0),
      appBar: AppBar(
        backgroundColor: const Color(0xff28227f),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            HomePageViewModel viewModel = Provider.of(
              context,
              listen: false,
            );
            viewModel.setCelsius(!(viewModel.isCelsius));
          },
          icon: Consumer<HomePageViewModel>(
            builder: (context, viewModel, child) {
              return Text(
                viewModel.buttonUnit,
                style: const TextStyle(color: Colors.white, fontSize: 23),
              );
            },
          ),
        ),
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
              onPressed: () async {
                HomePageViewModel viewModel =
                    Provider.of(context, listen: false);

                await viewModel.getUseLocation() ?? true
                    ? viewModel.loadWeatherLatLon().then((value) => {
                          if (value == null)
                            {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alertDialog(context);
                                },
                              )
                            }
                          else
                            {viewModel.mainweather = value},
                        })
                    : await viewModel.getStartingCity();
                viewModel.populateCities();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff441c50), Color(0xff28227f)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: ListView(
            children: [
              Column(
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
                          "assets/images/${viewModel.mainweather?.list[0].weather[0].main.name ?? "clear"}.png",
                          fit: BoxFit.fitHeight,
                        );
                      })),
                  Consumer<HomePageViewModel>(
                    builder: (context, viewModel, child) {
                      return Text(
                        "${(viewModel.tempCoefficient * (viewModel.mainweather?.list[0].main.temp ?? 0)).ceil()}°",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 64),
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
                        child: Consumer<HomePageViewModel>(
                            builder: (context, viewModel, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              customCard(
                                  "High",
                                  "${(viewModel.tempCoefficient * (viewModel.mainweather?.list[0].main.tempMax ?? 0)).ceil()}°",
                                  const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                  )),
                              customCard(
                                  "Low",
                                  "${(viewModel.tempCoefficient * (viewModel.mainweather?.list[0].main.tempMin ?? 0)).ceil()}°",
                                  const Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                  )),
                              customCard(
                                  "Feels Like",
                                  "${(viewModel.tempCoefficient * (viewModel.mainweather?.list[0].main.feelsLike ?? 0)).ceil()}°",
                                  const Icon(
                                    Icons.heart_broken,
                                    color: Colors.white,
                                  )),
                            ],
                          );
                        }),
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
                    child: Consumer<HomePageViewModel>(
                      builder: (context, viewModel, child) => ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        itemCount: viewModel.mainweather?.list.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          if (viewModel.mainweather!.list[index].dtTxt
                                  .difference(viewModel.temp)
                                  .inDays ==
                              1) {
                            viewModel.temp =
                                viewModel.mainweather!.list[index].dtTxt;
                            return customWeatherCard(
                              "${(viewModel.mainweather!.list[index].main.temp * viewModel.tempCoefficient).ceil()}°",
                              viewModel.mainweather!.list[index].weather[0].main
                                  .name,
                              viewModel.weekDay(viewModel
                                  .mainweather!.list[index].dtTxt.weekday),
                            );
                          } else {
                            return Container();
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
                    child: Consumer<HomePageViewModel>(
                      builder: (context, viewModel, child) => ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: (viewModel.cities.isEmpty)
                            ? 0
                            : viewModel.cities.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index >= viewModel.cityiesWeather.length) {
                            return Container();
                          }

                          return customCityWeatherCard(
                            "${(viewModel.cityiesWeather[index].list[0].main.temp * viewModel.tempCoefficient).ceil()}°",
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
            ],
          ),
        ),
      ),
    );
  }
}
