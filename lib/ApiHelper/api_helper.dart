import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Helper {
  Future<Map> fetchApiData(String search) async {
    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=782172140c2e48e7892102454243007&q=$search');

    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }
}
