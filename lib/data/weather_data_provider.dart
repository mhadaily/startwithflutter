import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

Future<WeatherInfo> fetchWeatherInfo() async {
  final http.Response res = await http.get('https://jsonkeeper.com/b/OOJE');
  if (res.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final WeatherInfo result = WeatherInfo.fromJson(jsonDecode(res.body));
    print(result);
    return result;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
