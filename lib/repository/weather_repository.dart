import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_app/api/config.dart';
import 'package:weather_forecast_app/api/error.dart';
import 'package:weather_forecast_app/api/http.dart';
import 'package:weather_forecast_app/models/weather_model.dart';
import 'package:weather_forecast_app/utills/constants/colors.dart';
import 'package:weather_forecast_app/view/components/custom_toaster.dart';
import 'package:weather_forecast_app/view/components/loading_dialogue.dart';
import 'package:weather_forecast_app/view_models/weather_view_model.dart';
class WeatherRepository {
  Future<bool?> getWeather({
    required BuildContext context,
    required String location,
  }) async {
    try {
      loadingDialogue(context);
      String url = "${ApiUrl.apiUrl}?q=$location&appid=${ApiUrl.apiKey}&units=metric";
      final response = await getJson(url);
      Future.microtask(() {
        context.pop();
        WeatherModel weatherModel = WeatherModel.fromJson(response);
        context.read<WeatherViewModel>().setWeatherData(weatherModel);
      });
      return true;
    } on ApiError catch (error) {
      Future.microtask(() {
        context.pop();
        showSnackBar(message: error.errorMessage, context: context, backGroundColor: ColorsConstant.kToolingErrorColor);
      });
      return null;
    }
  }
}
