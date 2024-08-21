import 'dart:convert';

import 'package:fudly/Models/FoodModel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class TetyController extends GetxController {
  List<Datum> dataList = [];
  List<Datum> alldataList = [];

  var count = 0.obs;
  var isLaoding = true.obs;
  var isallLaoding = true.obs;

  RxString id = "".obs;
}
