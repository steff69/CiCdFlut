import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fudly/Auth/VerificationsPage.dart';

import 'package:fudly/common/shimmers/custome_text.dart';

import 'package:fudly/common/shimmers/cutomButtomn.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/FoodController.dart';
import 'package:fudly/controller/RestaurantController.dart';
import 'package:fudly/r/Restaurant.dart';
import 'package:get/get.dart';

class FoodPage extends StatelessWidget {
  FoodPage({super.key, required this.food});

  var food;

  final TextEditingController perferenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FoodController c = Get.put(FoodController());
    var cc = Get.find<RestaurantController>();

    cc.getResautantById(food.restaurant);

    c.loadAdditives(food.additives);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.r),
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  child: PageView.builder(
                    itemCount: food.imageUrl.length,
                    itemBuilder: (context, i) {
                      return Container(
                        width: widthh,
                        height: hieght,
                        color: kLightwhite,
                        child: CachedNetworkImage(
                          imageUrl: food.imageUrl[i],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            food.imageUrl.length,
                            (index) {
                              return Container(
                                margin: EdgeInsets.all(4.h),
                                width: 10.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: kSecondary),
                              );
                            },
                          )),
                    )),
                Positioned(
                  top: 30.h,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Ionicons.chevron_back_circle,
                      color: kPrimary,
                      size: 40,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 12.w,
                    child: CustomButton(
                      onTap: () {
                        cc.getResautantById(food.restaurant);
                        cc.getResautantByIdAndFood(food.restaurant);

                        Get.to(() => RestaurantPagee());
                      },
                      btnwidh: 90.w,
                      text: "Open Restaurant",
                    ))
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        food.title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: kDark),
                      ),
                      Obx(
                        () => Text(
                          '\$ ${(food.price + c.additivePrice) * c.count.value}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: kPrimary),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    food.description,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: KGray),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 20.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(food.foodTags.length, (i) {
                        final tag = food.foodTags[i];
                        return Container(
                          margin: EdgeInsets.only(
                            right: 5.w,
                          ),
                          decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Text(
                              tag,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "additives and toppings",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: kDark),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => Column(
                      children: List.generate(c.additivesList.length, (index) {
                        final additive = c.additivesList[index];
                        return CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            activeColor: kSecondary,
                            dense: true,
                            value: additive.ischecked.value,
                            tristate: false,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  additive.title,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: kDark),
                                ),
                                Text(
                                  '\$ ${additive.price}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: kPrimary),
                                ),
                              ],
                            ),
                            onChanged: (bool? value) {
                              additive.toggleChecked();
                              c.getTotalPrice();
                            });
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quantity",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: kDark),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Obx(() => Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  c.increment();
                                },
                                child: Icon(AntDesign.pluscircleo),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "${c.count.value}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: kDark),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  c.decrement();
                                },
                                child: Icon(AntDesign.minuscircleo),
                              ),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "perferences",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kDark),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 65.h,
                    child: CustomTextWidget(
                      controller: perferenceController,
                      hintText: 'Add a note with your preferences',
                      maxlines: 3,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showVerificationsheet(context);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "place Order",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: kLightwhite),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: kSecondary,
                              radius: 20.r,
                              child: Icon(
                                Ionicons.cart,
                                color: kLightwhite,
                              ),
                            ),
                          )
                        ]),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Future<dynamic> showVerificationsheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      showDragHandle: true,
      builder: (context) {
        return Container(
          height: 500.h,
          width: widthh,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/restaurant_bk.png"),
                  fit: BoxFit.fill),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r))),
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Verify your number",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kPrimary),
                ),
                SizedBox(
                    height: 250.h,
                    child: Column(
                      children:
                          List.generate(verificationReasons.length, (index) {
                        return ListTile(
                          leading: Icon(
                            Icons.check_circle_outline,
                            color: kPrimary,
                          ),
                          title: Text(
                            verificationReasons[index],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        );
                      }),
                    )),
                SizedBox(
                  height: 2,
                ),
                CustomButton(
                  text: 'Verify phone Number',
                  btnheigh: 35.h,
                  onTap: () {
                    Get.to(() => VerificationsPage());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
