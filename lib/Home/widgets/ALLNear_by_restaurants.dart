import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fudly/Home/widgets/RestauranTile.dart';
import 'package:fudly/Models/RestaurantModel.dart';
import 'package:fudly/common/back_ground_container.dart';
import 'package:fudly/common/shimmers/foodlist_shimmer.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/constants/uidata.dart';
import 'package:fudly/controller/RestaurantController.dart';
import 'package:get/get.dart';

class AllNearByRetaurants extends StatelessWidget {
  const AllNearByRetaurants({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.find<RestaurantController>();

    return Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: kSecondary,
          title: const Text(
            'All Near By Retaurants',
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
                padding: EdgeInsets.all(12.w),
                child: Obx(() => c.isallLaoding == false
                    ? ListView(
                        scrollDirection: Axis.vertical,
                        children: List.generate(c.alldataList.length, (i) {
                          RestaurantModel restaurant = c.alldataList[i];
                          return RestauranTile(
                            restaurant: restaurant,
                          );
                        }))
                    : FoodsListShimmer()))));
  }
}
