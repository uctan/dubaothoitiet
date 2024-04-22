import 'package:dubaothoitiet/models/weather.dart';
import 'package:dubaothoitiet/repositories/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class WeatherProvider extends ChangeNotifier {
  Position? position;

  String nameCity = 'Ho Chi Minh';
  updatePosition(Position positionCurent) {
    position = positionCurent;
    notifyListeners();
  }

  Future<WeatherData> getWeatherCurent() async {
    WeatherData result = await ApiRepository.callApiGetWeather(position);
    nameCity = result.name;
    notifyListeners();
    return result;
  }

  Future<List<WeatherDetail>> getWeatherDetail() async {
    List<WeatherDetail> result =
        await ApiRepository.callApiGetWeatherDetail(position);
    return result;
  }
}
