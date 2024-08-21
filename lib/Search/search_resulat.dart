import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/Home/widgets/food_title.dart';
import 'package:fudly/Models/FoodModel.dart';
import 'package:fudly/common/shimmers/foodlist_shimmer.dart';

import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/searchController.dart';
import 'package:get/get.dart';

class SearchResults extends StatelessWidget {
  SearchResults({super.key, required this.data});

  List<Datum> data;

  @override
  Widget build(BuildContext context) {
    SerchController c = Get.find<SerchController>();

    return Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
        height: hieght,
        child: Obx(
          () => c.str == ''
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    Datum food = data[i];
                    return FoodTitle(food: food);
                  },
                )
              : FoodsListShimmer(),
        ));
  }
}
