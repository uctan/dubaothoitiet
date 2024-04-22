import 'package:dubaothoitiet/models/weather.dart';
import 'package:dubaothoitiet/page/home/widgets/Home_location.dart';
import 'package:dubaothoitiet/page/home/widgets/home_detail_weather.dart';
import 'package:dubaothoitiet/page/home/widgets/home_temperature.dart';
import 'package:dubaothoitiet/page/home/widgets/home_weather_icon.dart';
import 'package:dubaothoitiet/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherProvider>().getWeatherCurent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1D6CF3),
              Color(0xff19D2FE),
            ],
          ),
        ),
        child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherCurent(),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData) {
              return Container(
                child: Text('nodata'),
              );
            }

            WeatherData data = snapshot.data as WeatherData;
            print(data.weather[0].main);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeWeatherIcon(
                  nameIcon: data.weather[0].main,
                ),
                HomeTemperature(
                  temp: data.main.temp,
                ),
                HomeLocation(
                  nameLocation: data.name,
                ),
                SizedBox(
                  height: 40,
                ),
                HomeDetailWeather(
                  humidity: data.main.humidity,
                  speedWind: data.wind.speed,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
