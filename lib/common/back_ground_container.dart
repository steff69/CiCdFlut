import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/constants/constants.dart';

// ignore: must_be_immutable
class BackGroundContainer extends StatelessWidget {
  BackGroundContainer({super.key, required this.child, this.color});

  final Widget child;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthh,
      height: hieght,
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/restaurant_bk.png'),
            fit: BoxFit.cover,
            opacity: .7,
          )),
      child: child,
    );
  }
}
