import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fudly/Home/widgets/food_title.dart';
import 'package:fudly/Models/FoodModel.dart';
import 'package:fudly/common/shimmers/foodlist_shimmer.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/ControllerCategory.dart';
import 'package:get/get.dart';

class CategoryFoodList extends StatelessWidget {
  CategoryFoodList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CategoryController c = Get.find<CategoryController>();
    return SizedBox(
        width: widthh,
        height: hieght,
        child: Padding(
            padding: EdgeInsets.all(12.h),
            child: Obx(() => c.dataList.isNotEmpty
                    ? ListView.separated(
                        //tkhali ki tched lista wtheb thabetha maytaeech color azreg
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, i) {
                          Datum food = c.dataList![i];
                          return FoodTitle(
                            color: Colors.white,
                            food: food,
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 2,
                            ),
                        itemCount: c.dataList.length)
                    : FoodsListShimmer()
                //hethi mtaa reloade li dour
                )));
  }
}
