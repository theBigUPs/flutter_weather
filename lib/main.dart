import 'package:flutter/material.dart';
import 'package:flutter_weather/services/local_storage.dart';
import 'package:flutter_weather/services/service_adapter.dart';
import 'package:flutter_weather/ui/pages/home/home_page.dart';

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
      home: const HomePage(),
    );
  }
}


