import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/view/screen.dart';
import '../provider/weather_provider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider homeProvider = Provider.of(context, listen: false);
    WeatherProvider homeProviderTrue = Provider.of(context, listen: true);
    return FutureBuilder(
      future: homeProviderTrue.fromMap(homeProviderTrue.search),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            // backgroundColor:
            //     (homeProviderTrue.weatherModal!.currentModal.is_day == 1)
            //         ? Colors.orangeAccent.shade200
            //         : Colors.deepPurpleAccent.shade100,
            appBar: AppBar(
              backgroundColor:
                  (homeProviderTrue.weatherModal!.currentModal.is_day == 1)
                      ? Colors.orangeAccent.shade200
                      : Colors.deepPurpleAccent.shade100,
              title: const Text(
                'Weather',
                style: TextStyle(fontSize: 25),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 1000,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage((homeProviderTrue
                                          .weatherModal!.currentModal.is_day ==
                                      1)
                                  ? day
                                  : night),
                              fit: BoxFit.fill),
                        ),
                        child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: homeProviderTrue.weather.length,
                                  itemBuilder: (context, index) {
                                    final name = homeProviderTrue.weather[index]
                                        .split('-')
                                        .sublist(0, 1)
                                        .join('-');
                                    final status = homeProviderTrue
                                        .weather[index]
                                        .split('-')
                                        .sublist(1, 2)
                                        .join('-');
                                    final temp = homeProviderTrue.weather[index]
                                        .split('-')
                                        .sublist(2, 3)
                                        .join('-');
                                    final icon = homeProviderTrue.weather[index]
                                        .split('-')
                                        .sublist(3, 4)
                                        .join('-');
                                    return Container(
                                      margin: const EdgeInsets.all(7),
                                      height: 180,
                                      width: 500,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 13, top: 3),
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '$temp°',
                                                      style: const TextStyle(
                                                          fontSize: 50,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      width: 140,
                                                    ),
                                                    Image(
                                                      image: NetworkImage(
                                                          'http:$icon'),
                                                      height: 88,
                                                      fit: BoxFit.cover,
                                                      width: 100,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 23,
                                                ),
                                                Text(
                                                  name,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  status,
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 0, right: 10),
                                                child: IconButton(
                                                    onPressed: () {
                                                      homeProvider
                                                          .delete(index);
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.black,
                                                    )))
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
