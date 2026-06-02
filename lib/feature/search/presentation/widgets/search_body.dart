import 'package:flutter/material.dart';
import 'package:fresco/feature/search/presentation/cubit/search_state.dart';
import 'package:fresco/feature/search/presentation/widgets/search_empty.dart';
import 'package:fresco/feature/search/presentation/widgets/search_initial.dart';
import 'package:fresco/feature/search/presentation/widgets/search_loading.dart';
import 'package:fresco/feature/search/presentation/widgets/search_results/search_results.dart';

class SearchBody extends StatelessWidget {
  final SearchState state;

  const SearchBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is SearchInitial) return const SearchInitialWidget();

    if (state is SearchLoading) {
      return const SearchLoadingWidget();
    }

    if (state is SearchEmpty) {
      return const SearchEmptyWidget();
    }

    if (state is SearchLoaded) {
      return SearchResultsWidget(state: state as SearchLoaded);
    }

    return const SizedBox();
  }
}
