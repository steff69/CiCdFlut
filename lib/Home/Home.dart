import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:fudly/Home/widgets/ALLNear_by_restaurants.dart';
import 'package:fudly/Home/widgets/AllFastestFood.dart';
import 'package:fudly/Home/widgets/CategoryFoodList.dart';
import 'package:fudly/Home/widgets/Category_list.dart';
import 'package:fudly/Home/widgets/Recommendations.dart';
import 'package:fudly/Home/widgets/food_list.dart';
import 'package:fudly/Home/widgets/nearby_List.dart';
import 'package:fudly/common/custom_appbar.dart';
import 'package:fudly/common/custom_container.dart';
import 'package:fudly/common/heading.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/ControllerCategory.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController c = Get.put(CategoryController());

    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(90.h), child: CustomAppBar()),
        body: Container(
          child: SafeArea(
              child: CustomContainer(
                  containerConrent: Column(
            children: [
              CategotyList(),
              Obx(() => c.id == ''
                  ? Column(
                      children: [
                        Heading(
                            text: "Nearby Restaurants",
                            ontap: () {
                              Get.to(() => AllNearByRetaurants());
                            }),
                        NearByRestaurants(),
                        Heading(
                            text: "Try Something New ",
                            ontap: () {
                              Get.to(() => RecommendationsPage());
                            }),
                        FoodList(),
                        Heading(
                            text: "Food Closer to you",
                            ontap: () {
                              Get.to(() => AllFastestFood());
                            }),
                        NearByRestaurants(),
                      ],
                    )
                  : CustomContainer(
                      containerConrent: Column(
                      children: [
                        Heading(
                            ic: Icon(
                              Ionicons.close_circle,
                              color: kSecondary,
                              size: 25.sp,
                            ),
                            text: "Foods with Category  ",
                            ontap: () {}),
                        CategoryFoodList()
                      ],
                    )))
            ],
          ))),
        ));
  }
}
