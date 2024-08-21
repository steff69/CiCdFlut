import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/Models/RestaurantModel.dart';
import 'package:fudly/constants/constants.dart';

class RestauranTile extends StatelessWidget {
  const RestauranTile({super.key, required this.restaurant});
  final RestaurantModel restaurant;
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
                color: KGray.withOpacity(0.2)),
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
                        child: Image.network(restaurant.imageUrl),
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
                    Text(restaurant.title,
                        style: const TextStyle(
                          color: kDark,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        )),
                    Text(' Delivery time :${restaurant.time}',
                        style: const TextStyle(
                          color: kDark,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        )),
                    SizedBox(
                      width: widthh * 0.7,
                      child: Text(
                        restaurant.coords.address,
                        style: const TextStyle(
                          color: KGray,
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
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
                  color: restaurant.isAvailable == true ||
                          restaurant.isAvailable != null
                      ? kPrimary
                      : kSecondaryLight,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Text(
                restaurant.isAvailable == true || restaurant.isAvailable != null
                    ? "Open"
                    : "Closed",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kLightwhite,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
