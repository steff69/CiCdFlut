import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fudly/Home/widgets/restaurantWidger.dart';
import 'package:fudly/Models/RestaurantModel.dart';
import 'package:fudly/common/shimmers/categories_shimmer.dart';
import 'package:fudly/common/shimmers/foodlist_shimmer.dart';
import 'package:fudly/controller/RestaurantController.dart';
import 'package:fudly/hooks/RestaurantHook.dart';
import 'package:get/get.dart';

class NearByRestaurants extends StatelessWidget {
  NearByRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.find<RestaurantController>();

    return Container(
        height: 210.h,
        padding: EdgeInsets.only(left: 12.w, top: 10.h),
        child: Obx(() => data.isLaoding == false
            ? ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(data.dataList.length, (i) {
                  RestaurantModel restaurant = data.dataList[i];
                  return RestaurantWidget(
                    image: restaurant.imageUrl,
                    logo: restaurant.logoUrl,
                    rating: restaurant.ratingCount,
                    title: restaurant.title,
                    time: restaurant.time,
                    ontap: () {},
                  );
                }))
            : CatergoriesShimmer()));
  }
}
