import 'package:flutter/foundation.dart';
import '../ApiHelper/api_helper.dart';
import '../modal/weather_modal.dart';

class WeatherProvider extends ChangeNotifier
    {
  Helper helper = Helper();
  WeatherModal? weatherModal;
  String search = 'surat';

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

  WeatherProvider(){
    fromMap(search);
  }


}