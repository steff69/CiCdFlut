import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fudly/Models/CategoryModel.dart';
import 'package:http/http.dart' as http;

FeatchHook useFetchCategories() {
  final categoriesItems = useState<List<DatumC>>([]);
  final categoryModel = useState<CategoryModel?>(null);
  final isLaoding = useState<bool?>(null);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLaoding.value = true;

    final url = Uri.parse('http://10.0.2.2:5000/api/category');
    try {
      final response = await http.get(url);

      //print(jsonDecode(response.body)['data']);

      await jsonDecode(response.body)['data']
          .forEach((e) => categoriesItems.value.add(DatumC.fromJson(e)));

      print(categoriesItems.value);

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

  return FeatchHook(data: categoriesItems.value, isLaoding: isLaoding.value);
}

class FeatchHook {
  List<DatumC>? data;
  bool? isLaoding;

  FeatchHook({this.data, this.isLaoding});
}

class ApiError {}
