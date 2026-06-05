import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/core/errors/app_errors.dart';
import 'package:fresco/core/errors/exceptions.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/search_products.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;
  final SearchProducts searchProducts;

  ProductCubit(this.getProducts, this.searchProducts) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());

    try {
      final products = await getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      fetchProducts();
      return;
    }

    emit(ProductLoading());

    try {
      final products = await searchProducts(query);
      emit(ProductLoaded(products));
    } catch (e) {
      _handleError(e);
    }
  }

  void _handleError(Object e) {
    if (e is NetworkException) {
      emit(ProductError(AppErrors.networkError));
    } else if (e is AppTimeoutException) {
      emit(ProductError(AppErrors.timeoutError));
    } else if (e is ServerException) {
      emit(ProductError(AppErrors.serverError));
    } else {
      emit(ProductError(AppErrors.unexpectedError));
    }
  }
}
