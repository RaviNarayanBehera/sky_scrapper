import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ApiHelper/api_helper.dart';
import '../modal/weather_modal.dart';

class WeatherProvider extends ChangeNotifier
    {
  Helper helper = Helper();
  WeatherModal? weatherModal;
  String search = 'surat';
  List<String> weather = [];

  void searchCity(String city)
  {
    search = city;
    notifyListeners();
  }

  Future<WeatherModal?> fromMap(String city)
   async {
    final data = await helper.fetchApiData(search);
    weatherModal = WeatherModal.fromJson(data);
    return weatherModal;
  }

  Future<void> addFav(String name, String status, String temp,)
  async {
    String like = "$name-$status-$temp";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather.add(like);
    sharedPreferences.setStringList('weather', weather);
  }

  Future<void> getFav()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather = sharedPreferences.getStringList('weather')??[];
    print(weather);
    notifyListeners();
  }

  Future<void> delete(int index)
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    weather.removeAt(index);
    sharedPreferences.setStringList('weather', weather);
    notifyListeners();
  }


  WeatherProvider(){
    print(weather);
    getFav();
  }


}