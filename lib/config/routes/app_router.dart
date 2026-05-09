import 'package:fresco/feature/account/presentation/views/account_view.dart';
import 'package:fresco/feature/auth/presentation/login/views/login_view.dart';
import 'package:fresco/feature/auth/presentation/register/views/signup_view.dart';
import 'package:fresco/feature/auth/presentation/splash/views/spash_view.dart';
import 'package:fresco/feature/cart/presentation/views/cart_screen.dart';
import 'package:fresco/feature/category/presentation/views/category_view.dart';
import 'package:fresco/feature/home/presentation/views/home_view.dart';
import 'package:fresco/feature/layout/presentation/views/main_layout.dart';
import 'package:fresco/feature/orderReview/presentation/views/Order_Review_Screen.dart';
import 'package:fresco/feature/payment/presentation/views/payment_screen.dart';
import 'package:fresco/feature/product_details/presentation/views/product_details_view.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import 'package:fresco/feature/product_list/presentation/views/product_list.dart';
import 'package:fresco/feature/search/presentation/views/search_view.dart';
import 'package:fresco/feature/wishlist/presentation/views/wishlist_screen.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splashView,
  routes: [
    GoRoute(
      path: AppRoutes.splashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.signInView,
      builder: (context, state) => const LoginView(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainLayout(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.homeView,
              builder: (context, state) => const HomeView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.categoryView,
              builder: (context, state) => const CategoryView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.wishlistView,
              builder: (context, state) => const WishlistScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.accountView,
              builder: (context, state) => const AccountView(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.signUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: AppRoutes.cartView,
      builder: (context, state) {
        final product = state.extra as ListModel? ?? ListModel.listphoto[0];
        return CartScreen(addedProduct: product);
      },
    ),

    GoRoute(
      path: AppRoutes.orderReviewView,
      builder: (context, state) {
        final product = state.extra as ListModel? ?? ListModel.listphoto[0];
        return OrderReviewScreen(product: product);
      },
    ),

    GoRoute(
      path: AppRoutes.searchView,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: AppRoutes.ProductList,
      builder: (context, state) => const ProductList(),
    ),
    GoRoute(
      path: AppRoutes.productDetailsView,
      builder: (context, state) {
        final product = state.extra as ListModel;

        return ProductDetailsView(product: product);
      },
    ),
    GoRoute(
      path: AppRoutes.PaymentScreen,
      builder: (context, state) => const PaymentScreen(),
    ),
  ],
);
