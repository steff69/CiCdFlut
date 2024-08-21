import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fudly/Models/FoodModel.dart';

import 'package:fudly/constants/constants.dart';

class FoodTitle extends StatelessWidget {
  FoodTitle({super.key, required this.food, this.color});
  final Datum food;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: widthh,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: color ?? KGray.withOpacity(0.2)),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 70.w,
                        height: 70.w,
                        child: Image.network(food.imageUrl[0]),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                            color: KGray.withOpacity(0.6),
                            height: 16.h,
                            width: widthh,
                            child: RatingBarIndicator(
                              rating: 5,
                              itemCount: 5,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: kSecondary,
                              ),
                              itemSize: 15.h,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.title,
                        style: const TextStyle(
                          color: kDark,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        )),
                    Text(' Delivery time :${food.time}',
                        style: const TextStyle(
                          color: kDark,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        )),
                    SizedBox(
                        width: widthh * 0.7,
                        height: 15.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            var additive = food.additives[i];
                            return Container(
                              margin: EdgeInsets.only(right: 5.w),
                              decoration: BoxDecoration(
                                color: kSecondaryLight,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.r)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Text(
                                    additive.title,
                                    style: const TextStyle(
                                      color: KGray,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: food.additives.length,
                        ))
                  ],
                )
              ]),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              width: 60.w,
              height: 19.h,
              decoration: BoxDecoration(
                  color: kPrimary, borderRadius: BorderRadius.circular(10.r)),
              child: Text(
                " \$ ${food.price.toStringAsFixed(2)}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kLightwhite,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
              right: 75.w,
              top: 6.h,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 19.w,
                  height: 19.h,
                  decoration: BoxDecoration(
                    color: kSecondary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Icon(
                      MaterialCommunityIcons.cart_plus,
                      size: 15.h,
                      color: kLightwhite,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
