import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/Categories/all_Categories.dart';

import 'package:fudly/GetServices/CategoryService.dart';
import 'package:fudly/common/shimmers/categories_shimmer.dart';

import 'package:fudly/constants/constants.dart';

import 'package:fudly/controller/ControllerCategory.dart';

import 'package:get/get.dart';

class CategotyList extends HookWidget {
  CategotyList({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryService myController = Get.find<CategoryService>();
    CategoryController c = Get.find<CategoryController>();

    return Container(
        height: 80.h,
        padding: EdgeInsets.only(left: 12.w, top: 10.h),
        child: Obx(() => myController.isLaoding == false
            ? ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(myController.dataList.length, (i) {
                  var category = myController.dataList[i];
                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        if (c.id == category.id) {
                          c.changeCategory('');
                        } else if (category.title == 'More') {
                          Get.to(() => AllCategories());
                        } else if (c.id != category.id) {
                          c.changeCategory(category.id);
                          c.getcategoryFood(category.id);
                          c.isleo.value = true;
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5.w),
                        padding: EdgeInsets.only(top: 4.h),
                        width: widthh * 0.19,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: c.id == category.id
                                ? Border.all(color: kSecondary, width: 1.w)
                                : Border.all(color: Colors.white, width: 0)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 35.h,
                              child: Image.network(
                                category.imageUrl,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              '${category.title}',
                              style: const TextStyle(
                                  color: kDark,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }))
            : CatergoriesShimmer()));
  }
}
