import 'package:e_commerce_app_c11/core/my_bloc_observer.dart';
import 'package:e_commerce_app_c11/core/resources/custom_theme_data.dart';
import 'package:e_commerce_app_c11/core/resources/utils/shared_preferences_utils.dart';
import 'package:e_commerce_app_c11/core/routes_manager/route_generator.dart';
import 'package:e_commerce_app_c11/core/routes_manager/routes.dart';
import 'package:e_commerce_app_c11/di/di_impl.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/category/cubit/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPreferencesUtils.init();
  var token = SharedPreferencesUtils.loadData('token');
  String route;
  if (token == null) {
    route = Routes.signInRoute;
  } else {
    route = Routes.mainRoute;
  }
  runApp(MultiBlocProvider(providers: [
    BlocProvider<ProductsScreenViewModel>(
        create: (context) => ProductsScreenViewModel(
            getAllProductsUseCase: injectGetAllProductsUseCase(),
            addToCartUseCase: injectAddToCartUseCase()))
  ], child: MyApp(route: route)));
}

class MyApp extends StatelessWidget {
  String route;

  MyApp({required this.route});

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
