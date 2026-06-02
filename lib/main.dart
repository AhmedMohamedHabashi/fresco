import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:fresco/feature/product_list/data/data_sources/product_remote_data_source.dart';
import 'package:fresco/feature/product_list/data/repo/product_repository_impl.dart';
import 'package:fresco/feature/product_list/domain/usecases/get_products.dart';
import 'package:fresco/feature/product_list/domain/usecases/search_products.dart';
import 'app.dart';
import 'core/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp();

  final dio = DioHelper.dio;
  final remoteDataSource = ProductRemoteDataSource();
  final repo = ProductRepositoryImpl(remoteDataSource);
  final usecase = GetProducts(repo);
  final searchUsecase = SearchProducts(repo);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
          FrescoApp(getProducts: usecase, searchProducts: searchUsecase),
    ),
  );
}
