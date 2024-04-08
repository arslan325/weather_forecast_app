import 'package:go_router/go_router.dart';
import 'package:weather_forecast_app/utills/routes/route_names.dart';
import 'package:weather_forecast_app/view/home_screen.dart';
import 'package:weather_forecast_app/view/search_screen.dart';
import 'package:weather_forecast_app/view/splash_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: AppRouteNames.initialRoute,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: AppRouteNames.homeScreenRoute,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: AppRouteNames.searchScreenRoute,
    builder: (context, state) => const SearchScreen(),
  ),
]);
