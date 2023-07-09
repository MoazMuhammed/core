import 'package:core/CORE/API/endpoints.dart';
import 'package:core/CORE/shared_preferences/my_shared.dart';
import 'package:core/CORE/shared_preferences/my_shared_keys.dart';
import 'package:dio/dio.dart';

class MyDio {
  static late Dio dio;

  static init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds:90 * 100 ),
      receiveTimeout: const Duration(milliseconds:90 * 100 ),
      validateStatus: (status)=> true
    );

    dio = Dio(baseOptions);
  }

  static Future<Response?> get({required String endPoint}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": "Token ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };
    return await dio.get(endPoint);
  }

  static Future<Response?> post({required String endPoint, Map<String, dynamic>?data}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": "Token ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };
    return await dio.post(endPoint, data: data);
  }
  static Future<Response?> postLogin({required String endPoint, Map<String, dynamic>?data}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };
    return await dio.post(endPoint, data: data);
  }

  static Future<Response?> delete({required String endPoint}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": "Token ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };
    return await dio.delete(endPoint);
  }

  static Future<Response?> update({required String endPoint,required FormData fromData}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": "Token ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };
    return await dio.put(endPoint, data: fromData);
  }
  static Future<Response?> postFile({required String endPoint,required FormData fromData}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": "Token ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };
    return await dio.post(endPoint,data: fromData);

  }  static Future<Response?> patch({required String endPoint,required FormData fromData}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": "Token ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };
    return await dio.patch(endPoint,data: fromData);
  }
}
