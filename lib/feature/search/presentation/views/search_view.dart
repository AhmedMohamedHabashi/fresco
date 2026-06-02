import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/search/presentation/cubit/search_cubit.dart';
import 'package:fresco/feature/search/presentation/cubit/search_state.dart';
import 'package:fresco/feature/search/presentation/widgets/search_app_bar.dart';
import 'package:fresco/feature/search/presentation/widgets/search_body.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const SearchAppBar(),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: SearchBody(state: state),
          );
        },
      ),
    );
  }
}
