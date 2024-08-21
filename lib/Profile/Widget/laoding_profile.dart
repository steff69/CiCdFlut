import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/common/shimmers/cutomButtomn.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/login/login.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LaodingProfile extends StatelessWidget {
  const LaodingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 2,
        title: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'please login to access this page ',
            style: TextStyle(
              color: kwhite,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: widthh,
            height: hieght / 2,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: LottieBuilder.asset('assets/anime/delivery.json',
                  width: widthh, height: 500),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomButton(
            btnheigh: 40,
            onTap: () {
              Get.to(() => LoginPage());
            },
            color: kPrimary,
            text: 'L O G I N ',
          )
        ],
      ),
    );
  }
}
