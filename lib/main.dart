import 'package:e_commerce_app_c11/core/my_bloc_observer.dart';
import 'package:e_commerce_app_c11/core/resources/custom_theme_data.dart';
import 'package:e_commerce_app_c11/core/resources/utils/shared_preferences_utils.dart';
import 'package:e_commerce_app_c11/core/routes_manager/route_generator.dart';
import 'package:e_commerce_app_c11/core/routes_manager/routes.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/cubit/cart_products_screen_view_model.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/category/cubit/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'di/di.dart';
import 'features/main_layout/tabs/favourite/cubit/favourites_tab_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await SharedPreferencesUtils.init();
  var token = SharedPreferencesUtils.loadData('token');
  String route;
  if (token == null) {
    route = Routes.signInRoute;
  } else {
    route = Routes.mainRoute;
  }
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://d9e12b2c4b8f8c5839658749d5da83d7@o4507928342691840.ingest.us.sentry.io/4507928458821632';
      options.tracesSampleRate = 0.01;
    },
    appRunner: () => runApp(MultiBlocProvider(providers: [
      BlocProvider<ProductsScreenViewModel>(
        create: (context) => getIt<ProductsScreenViewModel>(),
      ),
      BlocProvider<FavouritesTabViewModel>(
        create: (context) => getIt<FavouritesTabViewModel>(),
      ),
      BlocProvider<CartProductsScreenViewModel>(
        create: (context) => getIt<CartProductsScreenViewModel>(),
      ),
    ], child: MyApp(route: route))),
  );
}

class MyApp extends StatelessWidget {
  String route;

  MyApp({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: CustomThemeData.lightMode,
        debugShowCheckedModeBanner: false,
        home: child,
        initialRoute: route,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
      minTextAdapt: true,
      designSize: const Size(430, 932),
    );
  }
}
