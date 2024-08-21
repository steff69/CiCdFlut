import 'package:flutter/material.dart';
import 'package:fudly/constants/constants.dart';
import 'package:lottie/lottie.dart';

class LaodingWidget extends StatelessWidget {
  const LaodingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthh,
      height: hieght,
      child: Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: LottieBuilder.asset(
          'assets/anime/delivery.json',
          width: widthh,
          height: hieght / 2,
        ),
      ),
    );
  }
}
