import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_app/utills/routes/custom_routes.dart';
import 'package:weather_forecast_app/utills/theme/app_theme.dart';
import 'package:weather_forecast_app/view_models/weather_view_model.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (BuildContext context, child) {
          return ChangeNotifierProvider(
            create: (context) => WeatherViewModel(),
            child: MaterialApp.router(
              title: 'Weather Forecast',
              debugShowCheckedModeBanner: false,
              theme: appTheme,
              routerConfig: router,
            ),
          );
        }
    );
  }
}
