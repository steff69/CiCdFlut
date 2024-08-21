import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/constants/constants.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    super.key,
    required this.image,
    required this.logo,
    required this.title,
    required this.time,
    required this.rating,
    required this.ontap,
  });

  final String image;
  final String logo;
  final String title;
  final String time;
  final String rating;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          height: 192.h,
          width: widthh * .75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: kLightwhite,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: SizedBox(
                        height: 112.h,
                        width: widthh * 0.8,
                        child: Image.network(
                          image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 10.w,
                        top: 10.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Container(
                            color: kLightwhite,
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.r),
                                child: Image.network(
                                  logo,
                                  fit: BoxFit.cover,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 12,
                            color: kDark,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Delivery time",
                            style: TextStyle(
                                fontSize: 9,
                                color: KGray,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            time,
                            style: const TextStyle(
                                fontSize: 9,
                                color: kDark,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBarIndicator(
                            rating: 5,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: kPrimary,
                            ),
                            itemCount: 5,
                            itemSize: 15.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "$rating  reviews and ratings",
                            style: const TextStyle(
                                fontSize: 9,
                                color: KGray,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
