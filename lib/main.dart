import 'package:flutter/material.dart';
import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';
import 'package:flutter_weather/src/ui/pages/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceAdapter();
  await getIt<LocalStorage>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      //TODO add routing here
      home: const HomePage(),
    );
  }
}
