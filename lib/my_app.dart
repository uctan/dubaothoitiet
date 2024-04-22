import 'package:dubaothoitiet/apps/config/them_custom.dart';
import 'package:dubaothoitiet/page/bottom_navigation_custom/bottom_custom.dart';
import 'package:dubaothoitiet/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.positionCurent});

  final Position positionCurent;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider()..updatePosition(positionCurent),
      child: MaterialApp(
        theme: ThemeCustom.themeLight,
        debugShowCheckedModeBanner: false,
        home: BottomNavigationCustom(),
      ),
    );
  }
}
