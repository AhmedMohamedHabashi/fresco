// import 'package:flutter/material.dart';
// import 'package:fresco/config/routes/app_router.dart';
// import 'package:fresco/core/app_responsive.dart';

// import 'package:fresco/feature/category/presentation/views/category_view.dart';
// import 'package:fresco/feature/home/presentation/views/home_view.dart';
// import 'package:fresco/feature/product_list/presentation/views/product_list.dart';

// class FrescoApp extends StatelessWidget {
//   const FrescoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppResponsive.init(
//       child: MaterialApp.router(
//         debugShowCheckedModeBanner: false,
//         routerConfig: router,
//         theme: ThemeData(fontFamily: 'Poppins'),
//         title: 'Fresco App',
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fresco/core/app_responsive.dart';
import 'package:fresco/feature/home/presentation/views/home_view.dart';
import 'package:fresco/feature/product_details/presentation/views/product_details_view.dart';
import 'package:fresco/feature/product_list/presentation/views/product_list.dart';

class FrescoApp extends StatelessWidget {
  const FrescoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsive.init(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        title: 'Fresco App',

        home: const HomeView(),
      ),
    );
  }
}
