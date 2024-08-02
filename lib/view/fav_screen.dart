import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/weather_provider.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider homeProvider = Provider.of(context, listen: false);
    WeatherProvider homeProviderTrue = Provider.of(context, listen: true);
    return FutureBuilder(future: homeProviderTrue.fromMap(homeProviderTrue.search), builder:
    (context, snapshot) {
      if(snapshot.hasData)
        {
          return Scaffold(
            backgroundColor: (homeProviderTrue.weatherModal!.currentModal
                .is_day == 1)
                ? Colors.orange.shade200
                : Colors.deepPurpleAccent.shade100,
            appBar: AppBar(
              backgroundColor: (homeProviderTrue.weatherModal!.currentModal
                  .is_day == 1)
                  ? Colors.orange.shade200
                  : Colors.deepPurpleAccent.shade100,
              title: const Text(
                'Weather',
                style: TextStyle(fontSize: 25),
              ),
            ),
            body: ListView.builder(
              itemCount: homeProvider.weather.length,
              itemBuilder: (context, index) {
                final name =
                homeProvider.weather[index].split('-').sublist(0, 1).join('-');
                final status =
                homeProvider.weather[index].split('-').sublist(1, 2).join('-');
                final temp =
                homeProvider.weather[index].split('-').sublist(2, 3).join('-');
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: (homeProviderTrue.weatherModal!.currentModal
                        .is_day == 1)
                        ? Colors.deepPurple.shade300
                        : Colors.orangeAccent.shade100,
                    child: ListTile(
                      leading: Text(
                        '$temp°',
                        style: TextStyle(fontSize: 25,color: (homeProviderTrue.weatherModal!.currentModal
                            .is_day == 1)
                            ? Colors.white
                            : Colors.black,),
                      ),
                      horizontalTitleGap: 20,
                      title: Text(
                        name,
                        style: TextStyle(fontSize: 23,letterSpacing: 1),
                      ),
                      subtitle: Text(status,style: TextStyle(color: (homeProviderTrue.weatherModal!.currentModal
                          .is_day == 1)
                          ? Colors.white
                          : Colors.black,),),
                      trailing: IconButton(
                          onPressed: () {
                            homeProvider.delete(index);
                          },
                          icon: const Icon(Icons.delete,color: Colors.black,)),
                    ),
                  ),
                );
              },
            ),
          );
        }
      else{
        return Center(child: CircularProgressIndicator());
      }
    },);
  }
}
