import 'package:flutter/material.dart';
import 'package:flutter_weather/src/ui/components/navbar.dart';
import 'package:flutter_weather/src/view_models/cities_viewmodel.dart';
import 'package:provider/provider.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({Key? key}) : super(key: key);

  @override
  CitiesPageState createState() => CitiesPageState();
}

class CitiesPageState extends State<CitiesPage> {
  late CitiesViewModel viewModel;
  final TextEditingController citySearch = TextEditingController();
  @override
  void initState() {
    super.initState();

    viewModel = Provider.of<CitiesViewModel>(context, listen: false);
    viewModel.readItemsFromFile().then(
          (value) => viewModel.citiesFromText = (value),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navbar(context, 1),
      appBar: AppBar(
        title: const Text(
          "Tap to Add Longtap to Delete",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff28227f),
      ),
      backgroundColor: const Color(0xff28227f),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[600]),
                hintText: "You Can Search Cities to Add Here",
                fillColor: Colors.white70,
              ),
              onChanged: (text) {
                viewModel.updateList(text);
              },
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            //height: 190,
            //width: 100,
            child: Consumer<CitiesViewModel>(
              builder: (context, viewModel, child) => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: viewModel.result.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onLongPress: () {
                      viewModel.deleteCity(viewModel.result[index], context);
                    },
                    onTap: () {
                      //homeviewModel.cities.add(viewModel.result[index]);
                      viewModel.addCity(viewModel.result[index], context);
                    },
                    title: Text(
                      viewModel.result[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
