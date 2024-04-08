import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_forecast_app/repository/location.dart';
import 'package:weather_forecast_app/repository/weather_repository.dart';
import 'package:weather_forecast_app/utills/constants/colors.dart';
import 'package:weather_forecast_app/utills/constants/images_path.dart';
import 'package:weather_forecast_app/utills/routes/route_names.dart';
import 'package:weather_forecast_app/view/components/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagesPath.splashImage),
            Text(
                'Weather',
                style: Theme.of(context).textTheme.displayLarge
            ),
            SizedBox(height: 10.h,),
            Text(
                'ForeCast',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorsConstant.kToolingYellowColor,
                )
            ),
            SizedBox(height: 40.h,),
            CustomButton(onTap: () async{
             String? location = await LocationService().getCurrentCityName(context);
             if(location != null){
               Future.microtask(() {
                 WeatherRepository().getWeather(context: context, location: location ?? "").then((value) {
                   if(value != null){
                     context.push(AppRouteNames.homeScreenRoute);
                   }
                 });
               });
             }
            }, buttonText: "Get Started"),
          ],
        ),
      ),
    );
  }
}
