import 'dart:async';
import 'package:dio/dio.dart';
import 'package:fresco/core/errors/exceptions.dart';
import 'package:fresco/core/network/api_keys.dart';
import 'package:fresco/core/network/endpoints.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import '../../../../core/network/dio_helper.dart';

class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await DioHelper.dio.get(Endpoints.products);

      return (response.data[ApiKeys.products] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final response = await DioHelper.dio.get(
        Endpoints.productsSearch,
        queryParameters: {'q': query},
      );

      return (response.data[ApiKeys.products] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return AppTimeoutException();

      case DioExceptionType.connectionError:
        return NetworkException();

      default:
        return ServerException();
    }
  }
}
