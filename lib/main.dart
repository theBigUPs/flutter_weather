import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/firebase_options.dart';
import 'package:flutter_weather/src/services/local_storage.dart';
import 'package:flutter_weather/src/services/service_adapter.dart';
import 'package:flutter_weather/src/ui/views/home_page.dart';
import 'package:flutter_weather/src/view_models/home_page_viewmodel.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceAdapter();
  await getIt<LocalStorage>().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: ChangeNotifierProvider(
        create: (BuildContext context) {
          return HomePageViewModel();
        },
        child: const HomePage(),
      ),
    );
  }
}
