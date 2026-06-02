import 'package:fresco/feature/product_list/domain/repo/product_repository.dart';
import '../../domain/entities/product.dart';
import '../data_sources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    final result = await remoteDataSource.getProducts();

    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    final result = await remoteDataSource.searchProducts(query);

    return result.map((e) => e.toEntity()).toList();
  }
}
