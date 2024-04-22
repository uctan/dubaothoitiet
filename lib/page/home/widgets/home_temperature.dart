import 'package:dubaothoitiet/apps/utils/const.dart';
import 'package:flutter/material.dart';

class HomeTemperature extends StatelessWidget {
  const HomeTemperature({super.key, required this.temp});

  final num temp;
  @override
  Widget build(BuildContext context) {
    return createTemp(temp);
  }
}
