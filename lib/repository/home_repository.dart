import 'dart:developer';
import 'package:dio/dio.dart';

class HomeRepository {
  static Future<String?> fetchRandomApi() async {
    try {
      Dio dio = Dio(BaseOptions());
      Response response = await dio.get('https://api.agify.io?name=bella');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["name"];
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
