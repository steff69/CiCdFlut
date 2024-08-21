import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fudly/Models/RestaurantModel.dart';

import 'package:http/http.dart' as http;

FetchHookRestaurant useFetchRestaurant() {
  final restaurantItems = useState<List<RestaurantModel>>([]);

  final isLaoding = useState<bool>(true);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLaoding.value = true;

    final url = Uri.parse('http://10.0.2.2:5000/api/restaurants/41007428');
    try {
      final response = await http.get(url);

      await jsonDecode(response.body).forEach(
          (e) => restaurantItems.value.add(RestaurantModel.fromJson(e)));

      print(restaurantItems.value);
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

  return FetchHookRestaurant(
      data: restaurantItems.value, isLaoding: isLaoding.value);
}

class FetchHookRestaurant {
  List<RestaurantModel>? data;
  bool? isLaoding;

  FetchHookRestaurant({this.data, this.isLaoding});
}

class ApiError {}
