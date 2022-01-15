import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:hetal_dave_practical/util/app_constants.dart';

import 'restarant_api_interceptor.dart';

class RestaurantServices {
  static var client = dio.Dio();

  Dio init() {
    client.interceptors.add(ApiInterceptors());
    // client.options.baseUrl = AppConstants.BASE_URL;
    return client;
  }

  //Fetch restaurant list
  static Future<dynamic> fetchItems() async {
    String theUrl = AppConstants.BASE_URL + AppConstants.RESTAURANT_API_URL;
    try {
      dio.Response response = await client
          .get(theUrl,
              options:
                  dio.Options(headers: {'Content-Type': 'application/json'}))
          .timeout(const Duration(seconds: 30));
      dynamic json = response.data;
      if (response.statusCode == 200) {
        print(json);
        return json;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      return null;
    }
  }
}
