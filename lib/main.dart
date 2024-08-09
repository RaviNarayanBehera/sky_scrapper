import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/provider/weather_provider.dart';
import 'package:sky_scrapper/view/fav_screen.dart';
import 'package:sky_scrapper/view/splash_screen.dart';
import 'package:sky_scrapper/view/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/weather': (context) => const WeatherScreen(),
          '/fav': (context) => const FavScreen(),
        },
      ),
    );
  }
}
