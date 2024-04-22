import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dubaothoitiet/models/weather.dart';
import 'package:dubaothoitiet/page/detail/widget/detail_body.dart';
import 'package:dubaothoitiet/provider/weather_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          future: context.read<WeatherProvider>().getWeatherDetail(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<WeatherDetail> listData = snapshot.data as List<WeatherDetail>;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: false,
                title: Row(
                  children: [
                    Icon(CupertinoIcons.location),
                    SizedBox(width: 15),
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          '${context.read<WeatherProvider>().nameCity} City',
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                actions: [
                  Icon(CupertinoIcons.search),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              body: DetailBody(
                listData: listData,
              ),
            );
          }),
    );
  }
}
