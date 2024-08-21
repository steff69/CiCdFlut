import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      this.btnwidh,
      this.btnheigh,
      this.text,
      this.color});

  final void Function()? onTap;
  final double? btnwidh;
  final double? btnheigh;
  final String? text;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: btnwidh ?? widthh,
          height: btnheigh ?? 28.h,
          decoration: BoxDecoration(
              color: color ?? kPrimary,
              borderRadius: BorderRadius.circular(12.r)),
          child: Center(
            child: Text(
              text ?? 'button',
              style: TextStyle(
                fontSize: 12,
                color: kLightwhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ));
  }
}
