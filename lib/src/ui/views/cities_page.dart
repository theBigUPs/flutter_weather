import 'package:flutter/material.dart';
import 'package:flutter_weather/src/ui/components/navbar.dart';
import 'package:flutter_weather/src/view_models/cities_viewmodel.dart';
import 'package:provider/provider.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({Key? key}) : super(key: key);

  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  late CitiesViewModel viewModel;
  final TextEditingController citySearch = TextEditingController();
  @override
  void initState() {
    super.initState();

    viewModel = Provider.of<CitiesViewModel>(context, listen: false);
    viewModel.readItemsFromFile().then(
          (value) => viewModel.cities = (value),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navbar(context, 1),
      appBar: AppBar(),
      backgroundColor: const Color(0xff28227f),
      body: SafeArea(
        child: Column(children: [
          TextField(
            controller: citySearch,
            onChanged: (text) {
              viewModel.updateList(text);
            },
          ),
          SizedBox(
            height: 190,
            //width: 100,
            child: Consumer<CitiesViewModel>(
              builder: (context, viewModel, child) => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: viewModel.result.length,
                itemBuilder: (BuildContext context, int index) {
                  //int originalIndex = index * 4;

                  return Text(
                    viewModel.result[index],
                    style: const TextStyle(color: Colors.white),
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
