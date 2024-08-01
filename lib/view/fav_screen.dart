import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/weather_provider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider homeProvider = Provider.of(context, listen: false);
    WeatherProvider homeProviderTrue = Provider.of(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView.builder(
        itemCount: homeProvider.weather.length,
        itemBuilder: (context, index) {
          final name = homeProvider.weather[index].split('-').sublist(0,1).join('-');
          final temp = homeProvider.weather[index].split('-').sublist(0,1).join('-');
          final status = homeProvider.weather[index].split('-').sublist(0,1).join('-');
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  color: Colors.orangeAccent.shade200,
                  child: ListTile(
                    leading: Text(homeProvider.weather[index],
                    ),
                    trailing: IconButton(onPressed: () {
                      homeProvider.delete(index);
                    }, icon: Icon(Icons.delete)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
