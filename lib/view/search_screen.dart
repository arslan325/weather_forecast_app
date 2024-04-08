import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_forecast_app/repository/location.dart';
import 'package:weather_forecast_app/repository/weather_repository.dart';
import 'package:weather_forecast_app/utills/routes/route_names.dart';
import 'package:weather_forecast_app/view/components/custom_text_field.dart';

import 'components/custom_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: _controller, hintText: "Enter city name"),
            SizedBox(height: 40.h,),
            CustomButton(onTap: () async{
             bool? isValid = await LocationService().validateCity(_controller.text,context);
             if(isValid != null){
               Future.microtask(() {
                 context.pop(_controller.text);
               });
             }
            }, buttonText: "Search"),
          ],
        ),
      ),
    );
  }
}
