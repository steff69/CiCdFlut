import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        //thot base url seaa
        baseUrl: 'http://10.0.2.2:5000/api',
        //ychabah barcha ltoken

        //nahineha li tahet msg hetha khater tnajem headers li bech nzidouhom ynahou lgdom
        // headers: {'Content-Type': 'application/json'},
        //jib data hata ken error
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'en',
      String? token,
      String? s}) async {
    dio.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': s ?? null,
    };

    return dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic>? data,
      String lang = 'en',
      String? token}) async {
    //fama apis yestahqou token
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json'
    };
// bech tposti lezem win ex user wdata waandek query ken mawjoud
    return dio.post(url, queryParameters: query, data: data);
  }
}
