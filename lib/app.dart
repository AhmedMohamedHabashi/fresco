import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/feature/account/presentation/cubit/account_cubit.dart';
import 'package:fresco/feature/auth/data/service/auth_service.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fresco/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:fresco/feature/home/presentation/cubit/favorites_cubit.dart';
import 'package:fresco/feature/product_list/domain/usecases/get_products.dart';
import 'package:fresco/feature/product_list/presentation/cubit/product_cubit.dart';
import 'package:fresco/feature/product_list/domain/usecases/search_products.dart';
import 'package:fresco/feature/search/presentation/cubit/search_cubit.dart';
import 'config/routes/app_router.dart';
import 'core/app_responsive.dart';

class FrescoApp extends StatelessWidget {
  final GetProducts getProducts;
  final SearchProducts searchProducts;

  const FrescoApp({
    super.key,
    required this.getProducts,
    required this.searchProducts,
  });

  @override
  Widget build(BuildContext context) {
    return AppResponsive.init(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthCubit(AuthService())),
          BlocProvider(create: (_) => AccountCubit()..getUser()),
          BlocProvider(
            create: (_) =>
                ProductCubit(getProducts, searchProducts)..fetchProducts(),
          ),
          BlocProvider(create: (_) => FavoritesCubit()),
          BlocProvider(create: (_) => CartCubit()),
          BlocProvider(create: (_) => SearchCubit(searchProducts)),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: ThemeData(fontFamily: 'Poppins'),
          title: 'Fresco App',
        ),
      ),
    );
  }
}
