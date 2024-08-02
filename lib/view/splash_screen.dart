import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sky_scrapper/view/weather_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const WeatherScreen()));
    });
    return const Scaffold(
      backgroundColor: Color(0xffFFFCC80),
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/weatherLogo.webp'),
              backgroundColor: Color(0xfffcc94a),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'WeatherApp',
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          // SizedBox(height: 2,),
          Text(
            'Your quick weather report',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400,letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}
