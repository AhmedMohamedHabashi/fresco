import 'package:dio/dio.dart';
import 'package:fresco/core/network/api_constants.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}
