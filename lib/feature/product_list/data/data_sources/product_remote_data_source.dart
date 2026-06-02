import 'package:dio/dio.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import '../../../../core/network/dio_helper.dart';

class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await DioHelper.dio.get('products');

      return (response.data['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception('Dio Error: ${e.message}');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final response = await DioHelper.dio.get(
        'products/search',
        queryParameters: {'q': query},
      );

      return (response.data['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception('Dio Error: ${e.message}');
    }
  }
}
