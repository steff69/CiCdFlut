import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/RestaurantController.dart';
import 'package:fudly/r/Widget/restaurantMenu.dart';
import 'package:fudly/r/Widget/rowtext.dart';

import 'package:fudly/r/direction_page.dart';
import 'package:get/get.dart';

import 'Widget/restaurant_bottom_bar.dart';

class RestaurantPagee extends StatefulWidget {
  const RestaurantPagee({super.key});

  @override
  State<RestaurantPagee> createState() => _RestaurantPageeState();
}

class _RestaurantPageeState extends State<RestaurantPagee>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    var c = Get.find<RestaurantController>();
    c.getResautantByIdAndFoodCode(c.restaurant!.code);

    print(c.restaurantFood);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: kLightwhite,
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 230.h,
                    width: widthh,
                    child: CachedNetworkImage(
                        imageUrl: c.restaurant!.imageUrl, fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      width: widthh,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: kPrimary.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.r),
                            topLeft: Radius.circular(8.r),
                          )),
                      child: RestaurantBottomBar(c: c),
                    ),
                  ),
                  Positioned(
                      top: 40.h,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Ionicons.chevron_back_circle,
                                size: 30,
                                color: kLightwhite,
                              ),
                            ),
                            Text(
                              c.restaurant!.title,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: kDark),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => DirectionPage());
                              },
                              child: Icon(
                                Ionicons.location,
                                size: 30,
                                color: kLightwhite,
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(children: [
                  RowText(first: "Distance to Restaurant", second: "2.7km"),
                  RowText(first: "Estimated Price", second: "2.7km"),
                  RowText(first: "Estimated Time", second: "30 min"),
                  Divider(
                    thickness: 0.7,
                  )
                ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Container(
                  decoration: BoxDecoration(
                      color: kOffwhite,
                      borderRadius: BorderRadius.circular(25.r)),
                  height: 25.h,
                  width: widthh,
                  child: TabBar(
                      indicator: BoxDecoration(
                          color: kPrimary,
                          borderRadius: BorderRadius.circular(25.r)),
                      labelColor: kLightwhite,
                      labelStyle: TextStyle(
                          color: kLightwhite,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                      unselectedLabelColor: kGrayLight,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: SizedBox(
                              width: widthh / 2,
                              height: 25,
                              child: Center(
                                child: Text("Menu"),
                              )),
                        ),
                        Tab(
                          child: SizedBox(
                              width: widthh / 2,
                              height: 25,
                              child: Center(
                                child: Text("Explore"),
                              )),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SizedBox(
                  height: hieght,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      RestaurantMenuWidget(foods: c.restaurantFood.value),
                      RestaurantMenuWidget(foods: c.restaurantFoodCode.value),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
