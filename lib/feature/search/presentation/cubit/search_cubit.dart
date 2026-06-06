import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/feature/product_list/domain/usecases/search_products.dart';
import 'package:fresco/feature/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchProducts searchProducts;

  SearchCubit(this.searchProducts) : super(SearchInitial());

  Timer? _debounce;

  String _currentQuery = '';

  String get currentQuery => _currentQuery;

  void onSearchChanged(String query) {
    final q = query.trim();
    _currentQuery = q;

    if (q.isEmpty) {
      _debounce?.cancel();
      emit(SearchInitial());
      return;
    }

    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(SearchLoading());

      try {
        final result = await searchProducts(q);

        if (result.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchLoaded(products: result, query: q));
        }
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }

  void clear() {
    _debounce?.cancel();
    _currentQuery = '';
    emit(SearchInitial());
  }

  void reset() {
    clear();
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
