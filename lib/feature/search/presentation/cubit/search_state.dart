import '../../../product_list/domain/entities/product.dart';

sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Product> products;
  final String query;

  SearchLoaded({required this.products, required this.query});
}

class SearchEmpty extends SearchState {}

class SearchSuggestions extends SearchState {
  final List<Product> suggestions;
  SearchSuggestions(this.suggestions);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
