import 'dart:async';
import 'dart:convert';

import 'package:fudly/Models/RestaurantModel.dart';
import 'package:fudly/controller/RestaurantController.dart';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class RestaurantServices extends GetxService {
  RestaurantController c = Get.put(RestaurantController());

  Future<void> fetchData() async {
    c.isLaoding.value = true;

    final url = Uri.parse('http://10.0.2.2:5000/api/restaurants/41007428');
    try {
      final response = await http.get(url);

      //print(jsonDecode(response.body)['data']);
      if (response.statusCode == 200) {
        await jsonDecode(response.body)
            .forEach((e) => c.dataList.add(RestaurantModel.fromJson(e)));
      }
    } catch (e) {
      print(e);
    } finally {
      // Timer.periodic(Duration(seconds: 5), (timer) {

      //});

      c.isLaoding.value = false;
    }
  }

  Future<void> fetchAllData() async {
    final url = Uri.parse('http://10.0.2.2:5000/api/restaurants/all/41007428');
    try {
      final response = await http.get(url);

      //print(jsonDecode(response.body)['data']);
      if (response.statusCode == 200) {
        await jsonDecode(response.body)['data']
            .forEach((e) => c.alldataList.add(RestaurantModel.fromJson(e)));
      }
    } catch (e) {
      print(e);
    } finally {
      // Timer.periodic(Duration(seconds: 5), (timer) {

      //});

      c.isallLaoding.value = false;
    }
  }

  Future<RestaurantServices> init() async {
    fetchData();
    fetchAllData();

    return this;
  }
}
