import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fudly/Home/widgets/foodWidget.dart';
import 'package:fudly/common/shimmers/categories_shimmer.dart';
import 'package:fudly/controller/testControl.dart';

import 'package:fudly/food/FoodPage.dart';
import 'package:fudly/hooks/FoodHook.dart';
import 'package:get/get.dart';

class FoodList extends StatelessWidget {
  FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    TetyController myController = Get.find<TetyController>();
    return Obx(() => Container(
        height: 210.h,
        padding: EdgeInsets.only(left: 12.w, top: 10.h),
        child: myController.isLaoding == false
            ? ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(myController.dataList.length, (i) {
                  var food = myController.dataList[i];
                  return FoodWidget(
                    image: food.imageUrl[0],
                    prise: food.price,
                    title: food.title,
                    time: food.time,
                    ontap: () {
                      Get.to(
                        () => FoodPage(
                          food: food,
                        ),
                      );
                    },
                  );
                }))
            : CatergoriesShimmer()));
  }
}
