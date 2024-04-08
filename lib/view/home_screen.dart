import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_app/repository/weather_repository.dart';
import 'package:weather_forecast_app/utills/constants/colors.dart';
import 'package:weather_forecast_app/utills/routes/route_names.dart';
import 'package:weather_forecast_app/view_models/weather_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final weatherProvider = context.watch<WeatherViewModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colorScheme.secondary,
        onPressed: () async{
         String? location = await context.push(AppRouteNames.searchScreenRoute);
         if(location !=null){
           Future.microtask(() {
             WeatherRepository().getWeather(context: context, location: location);
           });
         }
        },
        child: const Icon(Icons.location_on),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity,),
            Image.network('http://openweathermap.org/img/w/${weatherProvider.weatherModel?.weather?.first.icon ?? ''}.png',width: 150.w,height: 150.h,fit: BoxFit.cover,),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "${weatherProvider.weatherModel?.main?.temp} ",
                    style: Theme.of(context).textTheme.displayLarge
                  ),
                  TextSpan(
                    text: '\u00B0C',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            TitleAndDescription(title: 'Description',subTitle: weatherProvider.weatherModel?.weather?.first.description ?? '',),
            SizedBox(height: 10.h,),
            TitleAndDescription(title: 'Humidity',subTitle: "${weatherProvider.weatherModel?.main?.humidity}%",),
            SizedBox(height: 10.h,),
            TitleAndDescription(title: 'City',subTitle: weatherProvider.weatherModel?.name ?? '',),
            SizedBox(height: 10.h,),
            TitleAndDescription(title: 'Country',subTitle: weatherProvider.weatherModel?.sys?.country ?? '',),
          ],
        ),
      ),
    );
  }
}

class TitleAndDescription extends StatelessWidget {
  final String title;
  final String subTitle;
  const TitleAndDescription({
    super.key,
    required this.title, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "$title: ",
              style: Theme.of(context).textTheme.labelLarge,
          ),
          TextSpan(
            text: subTitle,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: ColorsConstant.kToolingYellowColor,
          ),
          ),
        ],
      ),
    );
  }
}
