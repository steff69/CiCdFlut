import 'dart:convert';

import 'package:fudly/Models/FoodModel.dart';
import 'package:fudly/controller/testControl.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class TestServices extends GetxService {
  TetyController c = Get.put(TetyController());

  Future<void> fetchallData() async {
    final url = Uri.parse('http://10.0.2.2:5000/api/food/all');
    try {
      final response = await http.get(url);

      //print(jsonDecode(response.body)['data']);
      if (response.statusCode == 200) {
        await jsonDecode(response.body)['data']
            .forEach((e) => c.alldataList.add(Datum.fromJson(e)));
      }
    } catch (e) {
      print(e);
    } finally {
      c.isallLaoding.value = false;
    }
  }

  Future<void> fetchData() async {
    final url = Uri.parse('http://10.0.2.2:5000/api/food/random/41007428');
    try {
      final response = await http.get(url);

      //print(jsonDecode(response.body)['data']);
      if (response.statusCode == 200) {
        await jsonDecode(response.body)['data']
            .forEach((e) => c.dataList.add(Datum.fromJson(e)));
      }
    } catch (e) {
      print(e);
    } finally {
      c.isLaoding.value = false;
    }
  }

  Future<TestServices> init() async {
    fetchData();
    fetchallData();

    return this;
  }
}
