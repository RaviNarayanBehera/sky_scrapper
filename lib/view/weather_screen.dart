import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/provider/weather_provider.dart';

TextEditingController txtSearchCity = TextEditingController();

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider homeProvider = Provider.of(context, listen: false);
    WeatherProvider homeProviderTrue = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: (homeProviderTrue.weatherModal!.currentModal.is_day == 1)
          ? Colors.orange.shade100
          : Colors.deepPurpleAccent.shade100,
      body: FutureBuilder(
        future: homeProvider.fromMap(homeProviderTrue.search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: (homeProviderTrue
                                          .weatherModal!.currentModal.is_day ==
                                      1)
                                  ? Colors.orange.shade100
                                  : Colors.deepPurpleAccent
                                      .shade100, // Background color
                              // Circular shape
                            ),
                            child: Center(
                              child: TextField(
                                controller: txtSearchCity,
                                style: TextStyle(
                                    color: (homeProviderTrue.weatherModal!
                                                .currentModal.is_day ==
                                            1)
                                        ? Colors.black
                                        : Colors.white),
                                cursorColor: (homeProviderTrue.weatherModal!
                                            .currentModal.is_day ==
                                        1)
                                    ? Colors.black
                                    : Colors.white,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  hintText: 'Enter City/State/Country',
                                  hintStyle: TextStyle(
                                    color: (homeProviderTrue.weatherModal!
                                                .currentModal.is_day ==
                                            1)
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            homeProvider.searchCity(txtSearchCity.text);
                          },
                          icon: Icon(
                            Icons.touch_app_outlined,
                            color: (homeProviderTrue
                                        .weatherModal!.currentModal.is_day ==
                                    1)
                                ? Colors.black
                                : Colors.white,
                            size: 25,
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 950,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage((homeProviderTrue
                                          .weatherModal!.currentModal.is_day ==
                                      1)
                                  ? day
                                  : night),
                              fit: BoxFit.fill),
                          color: Colors.red.shade200,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {



                                  },
                                  icon: const Icon(Icons.favorite_border)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              homeProviderTrue.weatherModal!.locationModal.name,
                              style: TextStyle(
                                  color: (homeProviderTrue.weatherModal!
                                              .currentModal.is_day ==
                                          1)
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5,
                                  height: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " ${homeProviderTrue.weatherModal!.currentModal.temp_c}",
                                    style: TextStyle(
                                        color: (homeProviderTrue.weatherModal!
                                                    .currentModal.is_day ==
                                                1)
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 100,
                                        fontWeight: FontWeight.w200,
                                        height: .8,
                                        letterSpacing: -.5),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '°C',
                                        style: TextStyle(
                                          color: (homeProviderTrue.weatherModal!
                                                      .currentModal.is_day ==
                                                  1)
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 55,
                                          fontWeight: FontWeight.w300,
                                          height: -.65,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Text(
                              homeProviderTrue
                                  .weatherModal!.currentModal.condition.text,
                              style: TextStyle(
                                color: (homeProviderTrue.weatherModal!
                                            .currentModal.is_day ==
                                        1)
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: (homeProviderTrue.weatherModal!
                                                .currentModal.is_day ==
                                            1)
                                        ? Colors.orange.shade100
                                        : Colors.deepPurpleAccent.shade100,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, bottom: 10, top: 10),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Today's Forecast",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(height: 15,),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ...List.generate(
                                              homeProviderTrue
                                                  .weatherModal!
                                                  .forecastModal
                                                  .forecastDay
                                                  .first
                                                  .hour
                                                  .length, (index) {
                                            final hour = homeProviderTrue
                                                .weatherModal!
                                                .forecastModal
                                                .forecastDay
                                                .first
                                                .hour[index];
                                            return SizedBox(
                                                height: 120,
                                                width: 80,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      hour.time
                                                          .split(" ")
                                                          .sublist(1, 2)
                                                          .join(" "),
                                                      style: TextStyle(
                                                          color: (homeProviderTrue
                                                                      .weatherModal!
                                                                      .currentModal
                                                                      .is_day ==
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
                                                          color: (homeProviderTrue
                                                                      .weatherModal!
                                                                      .currentModal
                                                                      .is_day ==
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
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Weather Deatils',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (homeProviderTrue.weatherModal!
                                                    .currentModal.is_day ==
                                                1)
                                            ? Colors.orange.shade100
                                            : Colors.deepPurple.shade300,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'W wind',
                                              style: TextStyle(
                                                  color: (homeProviderTrue
                                                              .weatherModal!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.black
                                                      : Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${homeProviderTrue.weatherModal!.currentModal.wind_kph} km/h',
                                                style: TextStyle(
                                                    color: (homeProviderTrue
                                                                .weatherModal!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (homeProviderTrue.weatherModal!
                                                    .currentModal.is_day ==
                                                1)
                                            ? Colors.orange.shade100
                                            : Colors.deepPurple.shade300,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Humidity',
                                              style: TextStyle(
                                                  color: (homeProviderTrue
                                                              .weatherModal!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.black
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${homeProviderTrue.weatherModal!.currentModal.humidity} %',
                                                style: TextStyle(
                                                    color: (homeProviderTrue
                                                                .weatherModal!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (homeProviderTrue.weatherModal!
                                                    .currentModal.is_day ==
                                                1)
                                            ? Colors.orange.shade100
                                            : Colors.deepPurple.shade300,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Pressure ',
                                              style: TextStyle(
                                                  color: (homeProviderTrue
                                                              .weatherModal!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.black
                                                      : Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${homeProviderTrue.weatherModal!.currentModal.pressure_mb} mb',
                                                style: TextStyle(
                                                    color: (homeProviderTrue
                                                                .weatherModal!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (homeProviderTrue.weatherModal!
                                                    .currentModal.is_day ==
                                                1)
                                            ? Colors.orange.shade100
                                            : Colors.deepPurple.shade300,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Visibility',
                                              style: TextStyle(
                                                  color: (homeProviderTrue
                                                              .weatherModal!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.black
                                                      : Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${homeProviderTrue.weatherModal!.currentModal.vis_km} km',
                                                style: TextStyle(
                                                    color: (homeProviderTrue
                                                                .weatherModal!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (homeProviderTrue.weatherModal!
                                                    .currentModal.is_day ==
                                                1)
                                            ? Colors.orange.shade100
                                            : Colors.deepPurple.shade300,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Feels Like ',
                                              style: TextStyle(
                                                  color: (homeProviderTrue
                                                              .weatherModal!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.black
                                                      : Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${homeProviderTrue.weatherModal!.currentModal.feelslike_c}°',
                                                style: TextStyle(
                                                    color: (homeProviderTrue
                                                                .weatherModal!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (homeProviderTrue.weatherModal!
                                                    .currentModal.is_day ==
                                                1)
                                            ? Colors.orange.shade100
                                            : Colors.deepPurple.shade300,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Clouds  ',
                                              style: TextStyle(
                                                  color: (homeProviderTrue
                                                              .weatherModal!
                                                              .currentModal
                                                              .is_day ==
                                                          1)
                                                      ? Colors.black
                                                      : Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                                '${homeProviderTrue.weatherModal!.currentModal.cloud}%',
                                                style: TextStyle(
                                                    color: (homeProviderTrue
                                                                .weatherModal!
                                                                .currentModal
                                                                .is_day ==
                                                            1)
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

String day = 'assets/images/day1.png';
String night = 'assets/images/night1.png';
