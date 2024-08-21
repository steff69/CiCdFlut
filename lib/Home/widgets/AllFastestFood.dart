import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fudly/Home/widgets/food_title.dart';
import 'package:fudly/Models/FoodModel.dart';

import 'package:fudly/common/back_ground_container.dart';
import 'package:fudly/common/shimmers/foodlist_shimmer.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/constants/uidata.dart';
import 'package:fudly/controller/testControl.dart';
import 'package:get/get.dart';

class AllFastestFood extends StatelessWidget {
  const AllFastestFood({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.find<TetyController>();

    return Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: kSecondary,
          title: const Text(
            'Fastest Foods',
            style: TextStyle(
              color: KGray,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: BackGroundContainer(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Obx(() => c.isallLaoding == false
                    ? ListView(
                        scrollDirection: Axis.vertical,
                        children: List.generate(c.alldataList.length, (i) {
                          Datum food = c.alldataList[i];
                          return FoodTitle(
                            food: food,
                          );
                        }))
                    : FoodsListShimmer()))));
    ;
  }
}
