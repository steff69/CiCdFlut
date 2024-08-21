import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/constants/constants.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.prise,
    required this.ontap,
  });

  final String image;

  final String title;
  final String time;
  final double prise;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          height: 180.h,
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
                child: ClipRRect(
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 12,
                                color: kDark,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '\$ $prise',
                            style: const TextStyle(
                                fontSize: 12,
                                color: kPrimary,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
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
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
