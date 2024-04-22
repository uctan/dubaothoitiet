import 'package:dubaothoitiet/apps/utils/const.dart';
import 'package:dubaothoitiet/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.listData});
  final List<WeatherDetail> listData;
  @override
  Widget build(BuildContext context) {
    print(listData);
    return ListView.separated(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (context, index) {
        DateTime dateTime = DateTime.parse(listData[index].dt_txt);
        String formatDay = DateFormat('EEEE').format(dateTime);
        String formatTime = DateFormat('HH:MM').format(dateTime);
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        createTemp(
                          listData[index].main.temp,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          listData[index].weather.main,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      formatDay,
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '19:00',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 4,
                child: Image.asset(
                  AssetCustom.getLinkImg(listData[index].weather.main),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, _) => const SizedBox(
        height: 15,
      ),
      itemCount: 20,
    );
  }
}
