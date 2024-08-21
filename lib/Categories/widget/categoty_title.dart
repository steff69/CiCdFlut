import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/Categories/Category_page.dart';
import 'package:fudly/constants/constants.dart';

class CategotyTitle extends StatelessWidget {
  CategotyTitle({
    super.key,
    required this.category,
  });

  var category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryPage(),
            ));
      },
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(
          category.imageUrl,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        '${category.title}',
        style: TextStyle(
            fontSize: 12, color: KGray, fontWeight: FontWeight.normal),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: KGray,
        size: 15.r,
      ),
    );
  }
}
