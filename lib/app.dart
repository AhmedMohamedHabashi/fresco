import 'package:flutter/material.dart';
import 'package:fresco/config/routes/app_router.dart';
import 'package:fresco/core/app_responsive.dart';

class FrescoApp extends StatelessWidget {
  const FrescoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AppResponsive.init(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(fontFamily: 'Poppins'),
        title: 'Fresco App',
      ),
    );
  }
}
// }
// import 'package:flutter/material.dart';
// import 'package:fresco/core/app_responsive.dart';
// import 'package:fresco/feature/account/presentation/views/account_view.dart';
// import 'package:fresco/feature/cart/presentation/views/cart_screen.dart';
// import 'package:fresco/feature/home/presentation/views/home_view.dart';

// class FrescoApp extends StatelessWidget {
//   const FrescoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppResponsive.init(
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(fontFamily: 'Poppins'),
//         title: 'Fresco App',

//         home: const HomeView(),
//       ),
//     );
//   }
// }
