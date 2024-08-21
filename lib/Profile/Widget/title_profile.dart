import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fudly/constants/constants.dart';

class ProfileTitleWidget extends StatelessWidget {
  const ProfileTitleWidget(
      {super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0),
      child: ListTile(
          visualDensity: VisualDensity.compact,
          onTap: onTap,
          leading: Icon(
            icon,
            size: 18,
          ),
          title: Text(
            title,
            style: const TextStyle(
                color: KGray, fontWeight: FontWeight.normal, fontSize: 14),
          ),
          trailing: title != "Setting"
              ? Icon(
                  AntDesign.right,
                  size: 16,
                )
              : SvgPicture.asset(
                  "assets/icons/usa.svg",
                  width: 15,
                  height: 20.h,
                )),
    );
  }
}
