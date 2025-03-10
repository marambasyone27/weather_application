import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Splash.dart';
import 'package:weather_app/pages/home/home_screen.dart';
import 'package:weather_app/utils/Binding/HomeBinding.dart';
import 'package:weather_app/widget/my_chart.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Splash(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
