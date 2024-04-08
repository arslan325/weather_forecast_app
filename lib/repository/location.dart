import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_forecast_app/utills/constants/colors.dart';
import 'package:weather_forecast_app/view/components/custom_toaster.dart';
import 'package:weather_forecast_app/view/components/loading_dialogue.dart';

class LocationService{
  Future<String?> getCurrentCityName(BuildContext context) async {
    try {
      loadingDialogue(context);
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placeMarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      Future.microtask(() {
        context.pop();
      });
      return placeMarks.first.locality;
    } catch (e) {
      Future.microtask(() {
        context.pop();
        showSnackBar(message: "Failed to get current country name: $e", context: context, backGroundColor: ColorsConstant.kToolingErrorColor);
      });
    }
    return null;
  }

  Future<bool?> validateCity(String input,BuildContext context) async {
    try {
      loadingDialogue(context);
      List<Location> locations = await locationFromAddress(input);
      Future.microtask(() {
        context.pop();
      });
      return locations.isNotEmpty ? true : null;
    } catch (e) {
      Future.microtask(() {
        context.pop();
        showSnackBar(message: "invalid city name", context: context, backGroundColor: ColorsConstant.kToolingErrorColor);
      });
    }
    return null;
  }
}