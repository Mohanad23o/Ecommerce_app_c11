import 'package:e_commerce_app_c11/core/my_bloc_observer.dart';
import 'package:e_commerce_app_c11/core/resources/custom_theme_data.dart';
import 'package:e_commerce_app_c11/core/routes_manager/route_generator.dart';
import 'package:e_commerce_app_c11/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: CustomThemeData.lightMode,
        debugShowCheckedModeBanner: false,
        home: child,
        initialRoute: Routes.splashScreenRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
      minTextAdapt: true,
      designSize: Size(430, 932),
    );
  }
}
