import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:fudly/Models/FoodModel.dart';
import 'package:http/http.dart' as http;

FetchHookFood useFetchFood() {
  final foodsItems = useState<List<Datum>>([]);

  final isLaoding = useState<bool?>(null);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLaoding.value = true;

    final url = Uri.parse('http://10.0.2.2:5000/api/food/all');
    try {
      final response = await http.get(url);

      //print(jsonDecode(response.body)['data']);

      await jsonDecode(response.body)['data']
          .forEach((e) => foodsItems.value!.add(Datum.fromJson(e)));

      print(foodsItems.value);

      // categoriesItems.value = DatumC.fromJson(jsonDecode(response.body['data']));

      //categoryModel.value!.data.forEach((e) => categoriesItems!.add(e));
    } catch (e) {
      print(e);
    } finally {
      isLaoding.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLaoding.value = true;
    fetchData();
  }

  return FetchHookFood(data: foodsItems.value, isLaoding: isLaoding.value);
}

class FetchHookFood {
  List<Datum>? data;
  bool? isLaoding;

  FetchHookFood({this.data, this.isLaoding});
}

class ApiError {}
