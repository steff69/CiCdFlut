import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fudly/Cart/Cart.dart';
import 'package:fudly/Home/Home.dart';
import 'package:fudly/Profile/Profile.dart';
import 'package:fudly/Search/Search.dart';
import 'package:fudly/controller/HomeController.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    HomeController c = Get.put(HomeController());

    List<Widget> bottomScreens = const [
      HomePage(),
      SearchPage(),
      CartPage(),
      ProfilePage(),
    ];

    return Scaffold(
        body: Obx(
      () => Stack(
        children: [
          bottomScreens[c.currentIndex.value],
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
                data: Theme.of(context).copyWith(canvasColor: kPrimary),
                child: BottomNavigationBar(
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  unselectedIconTheme: IconThemeData(color: Colors.black38),
                  selectedIconTheme: IconThemeData(color: kSecondary),
                  onTap: (value) {
                    c.changeBottom(value);
                  },
                  currentIndex: c.currentIndex.value,
                  items: [
                    BottomNavigationBarItem(
                        icon: c.currentIndex.value == 0
                            ? Icon(AntDesign.appstore1)
                            : Icon(AntDesign.appstore_o),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search), label: 'Searcg'),
                    BottomNavigationBarItem(
                        icon: Badge(
                            label: Text("10"),
                            child: Icon(FontAwesome.opencart)),
                        label: 'Cart'),
                    BottomNavigationBarItem(
                        icon: c.currentIndex.value == 3
                            ? Icon(FontAwesome.user_circle)
                            : Icon(FontAwesome.user_circle_o),
                        label: 'Profile'),
                  ],
                )),
          ),
        ],
      ),
    ));
  }
}
