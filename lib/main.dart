import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fudly/GetServices/CategoryService.dart';
import 'package:fudly/GetServices/RestaurantServices.dart';
import 'package:fudly/GetServices/testservicese.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/remote/dioHelper.dart';

import 'package:fudly/views/entrypoint.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await inittalServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 825),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'fudly',
            theme: ThemeData(
                scaffoldBackgroundColor: kOffwhite,
                iconTheme: IconThemeData(color: kDark),
                primarySwatch: Colors.grey),
            home: const MainScreen(),
          );
        });
  }
}

Future inittalServices() async {
  await Get.putAsync(() => TestServices().init());
  await Get.putAsync(() => RestaurantServices().init());
  await Get.putAsync(() => CategoryService().init());
}
