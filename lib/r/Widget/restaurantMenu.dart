import 'package:flutter/material.dart';
import 'package:fudly/Home/widgets/food_title.dart';
import 'package:fudly/Models/FoodModel.dart';
import 'package:fudly/common/shimmers/foodlist_shimmer.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/RestaurantController.dart';
import 'package:get/get.dart';

class RestaurantMenuWidget extends StatelessWidget {
  const RestaurantMenuWidget({super.key, required this.foods});

  final List<Datum> foods;

  @override
  Widget build(BuildContext context) {
    var c = Get.find<RestaurantController>();

    return Scaffold(
      backgroundColor: kLightwhite,
      body: Container(
        height: hieght,
        child: Obx(() => c.laodingR == true
            ? ListView(
                padding: EdgeInsets.zero,
                children: List.generate(foods.length, (index) {
                  final Datum food = foods[index];
                  return FoodTitle(food: food);
                }),
              )
            : FoodsListShimmer()),
      ),
    );
  }
}
