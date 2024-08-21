import 'dart:async';
import 'dart:convert';

import 'package:fudly/Models/FoodModel.dart';
import 'package:fudly/Models/RestaurantModel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  List<RestaurantModel> dataList = [];
  List<RestaurantModel> alldataList = [];
  RxList<Datum> restaurantFood = RxList<Datum>();
  RxList<Datum> restaurantFoodCode = RxList<Datum>();

  RxBool laodingR = false.obs;

  var count = 0.obs;
  var isLaoding = true.obs;
  var isallLaoding = true.obs;

  RestaurantModel? restaurant;

  RxString id = "".obs;

  void getResautantById(String id) async {
    final url = Uri.parse(
        'http://10.0.2.2:5000/api/restaurants/byid/6600bc195d9c2f713d52a704');
    try {
      final response = await http.get(url);

      //print(jsonDecode(response.body)['data']);
      if (response.statusCode == 200) {
        restaurant = RestaurantModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    } finally {
      // Timer.periodic(Duration(seconds: 5), (timer) {

      //});
    }
  }

  void getResautantByIdAndFood(String id) async {
    laodingR.value = false;
    restaurantFood.value = [];

    final url = Uri.parse(
        'http://10.0.2.2:5000/api/food/restaurant-foods/6530ebbcc9e72013e5b65933');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        jsonDecode(response.body)
            .forEach((e) => restaurantFood.value.add(Datum.fromJson(e)));

        Timer.periodic(Duration(seconds: 2), (timer) {
          laodingR.value = true;
        });
      }
    } catch (e) {
      print(e);
    } finally {
      // Timer.periodic(Duration(seconds: 5), (timer) {

      //});
    }
  }

  void getResautantByIdAndFoodCode(String code) async {
    laodingR.value = false;
    restaurantFoodCode.value = [];

    final url = Uri.parse('http://10.0.2.2:5000/api/food/random/41007428');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        jsonDecode(response.body)['data']
            .forEach((e) => restaurantFoodCode.value.add(Datum.fromJson(e)));

        Timer.periodic(Duration(seconds: 2), (timer) {
          laodingR.value = true;
        });
      }
    } catch (e) {
      print(e);
    } finally {
      // Timer.periodic(Duration(seconds: 5), (timer) {

      //});
    }
  }
}
