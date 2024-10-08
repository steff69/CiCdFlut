import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fudly/Home/Home.dart';
import 'package:fudly/Profile/Widget/laoding_profile.dart';
import 'package:fudly/Profile/Widget/title_profile.dart';
import 'package:fudly/common/custom_container.dart';
import 'package:fudly/common/shimmers/ProfileAppBar.dart';
import 'package:fudly/common/shimmers/cutomButtomn.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/LoginController.dart';
import 'package:fudly/views/entrypoint.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(LoginController());

    final box = GetStorage();

    var user = box.read("user");
    var token = box.read("token");

    if (token == null) {
      return const LaodingProfile();
    }

    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h), child: ProfileAppBar()),
        body: SafeArea(
            child: CustomContainer(
                containerConrent: Column(
          children: [
            Container(
              height: hieght * 0.07,
              width: widthh,
              decoration: BoxDecoration(
                  color: kLightwhite, borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 0, 16, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(children: [
                      CircleAvatar(
                        radius: 23.r,
                        backgroundColor: kSecondary,
                        backgroundImage: NetworkImage(user == null
                            ? 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg'
                            : user["profile"] == ''
                                ? 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg'
                                : user["profile"]),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user != null ? '${user['Username']}' : "Username",
                            style: TextStyle(
                                color: kDark,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                          ),
                          Text(
                            user != null ? '${user['email']}' : "email",
                            style: TextStyle(
                                color: kDark,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        MaterialCommunityIcons.image_edit_outline,
                        size: 23,
                      )
                    ]),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: kLightwhite,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProfileTitleWidget(
                    title: 'My Orders',
                    icon: Ionicons.fast_food_outline,
                    onTap: () {
                      // Get.to(() => LaodingProfile());
                    },
                  ),
                  ProfileTitleWidget(
                      title: 'My Favorite Places',
                      icon: Ionicons.heart_outline),
                  ProfileTitleWidget(
                      title: 'Review', icon: Ionicons.chatbubble_outline),
                  ProfileTitleWidget(
                      title: 'Coupons',
                      icon: MaterialCommunityIcons.tag_outline),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: kLightwhite,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProfileTitleWidget(
                      title: 'Shipping Address',
                      icon: SimpleLineIcons.location_pin),
                  ProfileTitleWidget(
                      title: 'Servie Center', icon: AntDesign.customerservice),
                  ProfileTitleWidget(
                      title: 'Coupons', icon: MaterialIcons.rss_feed),
                  ProfileTitleWidget(title: 'Setting', icon: AntDesign.setting),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onTap: () {
                c.logout();

                Get.offAll(() => MainScreen());
              },
              color: kRed,
              text: 'Logout',
              btnheigh: 35,
            )
          ],
        ))));
  }
}
