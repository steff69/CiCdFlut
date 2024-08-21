import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fudly/common/shimmers/cutomButtomn.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/RestaurantController.dart';
import 'package:fudly/r/RatingPage.dart';
import 'package:get/get.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    super.key,
    required this.c,
  });

  final RestaurantController c;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBarIndicator(
          itemCount: 5,
          itemSize: 23,
          rating: c.restaurant!.rating.toDouble(),
          itemBuilder: (context, i) {
            return Icon(
              Icons.star,
              color: Colors.yellow,
            );
          },
        ),
        CustomButton(
          onTap: () {
            Get.to(() => RatingPage());
          },
          color: kSecondary,
          btnwidh: widthh / 3,
          text: "Rate Restaurant",
        )
      ],
    );
  }
}
