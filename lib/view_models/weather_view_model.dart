import 'package:flutter/material.dart';
import 'package:weather_forecast_app/models/weather_model.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherModel? _weatherModel;
  WeatherModel? get weatherModel => _weatherModel;

  void setWeatherData(WeatherModel data) {
    _weatherModel = data;
    notifyListeners();
  }
}
