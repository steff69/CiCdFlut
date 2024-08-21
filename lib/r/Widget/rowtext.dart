import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/constants/constants.dart';

class RowText extends StatelessWidget {
  RowText({super.key, required this.first, required this.second});

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            first,
            style: const TextStyle(
                color: KGray, fontWeight: FontWeight.w500, fontSize: 10),
          ),
          Text(
            second,
            style: const TextStyle(
                color: KGray, fontWeight: FontWeight.w500, fontSize: 10),
          )
        ],
      ),
    );
  }
}
