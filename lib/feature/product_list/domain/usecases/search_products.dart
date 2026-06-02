import '../entities/product.dart';
import '../repo/product_repository.dart';

class SearchProducts {
  final ProductRepository repository;

  SearchProducts(this.repository);

  Future<List<Product>> call(String query) {
    return repository.searchProducts(query);
  }
}
