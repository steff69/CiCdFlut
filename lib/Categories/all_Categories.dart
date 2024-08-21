import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fudly/GetServices/CategoryService.dart';
import 'package:fudly/common/back_ground_container.dart';
import 'package:fudly/common/shimmers/foodlist_shimmer.dart';
import 'package:fudly/constants/constants.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'widget/categoty_title.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryService myController = Get.find<CategoryService>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffwhite,
        title: Text(
          'All categories',
          style: TextStyle(
            color: KGray,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
      body: BackGroundContainer(
          child: Container(
              padding: EdgeInsets.only(left: 12.w, top: 10.h),
              height: hieght,
              child: Obx(() => myController.isLaoding == true
                  ? FoodsListShimmer()
                  : ListView(
                      scrollDirection: Axis.vertical,
                      children:
                          List.generate(myController.dataList.length, (i) {
                        var category = myController.dataList[i];
                        return CategotyTitle(category: category);
                      }))))),
    );
  }
}
