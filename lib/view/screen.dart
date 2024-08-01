import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/provider/weather_provider.dart';

TextEditingController txtSearchCity = TextEditingController();

class WeatherScreen1 extends StatelessWidget {
  const WeatherScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider homeProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    WeatherProvider homeProviderTrue =
        Provider.of<WeatherProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: (homeProviderTrue.weatherModal!.currentModal.is_day == 1)
          ? Colors.orange.shade100
          : Colors.deepPurpleAccent.shade100,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Today's Forecast",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          // SizedBox(height: 15,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    homeProviderTrue.weatherModal!.forecastModal.forecastDay
                        .first.hour.length, (index) {
                  final hour = homeProviderTrue.weatherModal!.forecastModal
                      .forecastDay.first.hour[index];
                  return SizedBox(
                      height: 120,
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hour.time.split(" ").sublist(1, 2).join(" "),
                            style: TextStyle(
                                color: (homeProviderTrue.weatherModal!
                                            .currentModal.is_day ==
                                        1)
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 18),
                          ),
                          Image.network(
                              'https:${hour.hourConditionModal.icon}'),
                          Text(
                            '${hour.temp_c}',
                            style: TextStyle(
                                color: (homeProviderTrue.weatherModal!
                                            .currentModal.is_day ==
                                        1)
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ));
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String day = 'assets/images/day1.png';
String night = 'assets/images/night1.png';
