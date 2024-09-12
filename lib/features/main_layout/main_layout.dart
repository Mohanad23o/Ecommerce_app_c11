import 'package:e_commerce_app_c11/core/resources/color_manager.dart';
import 'package:e_commerce_app_c11/core/resources/image_assets.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/category/products_tab.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/favourite/favourites_tab.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/home/home_tab.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [
    const HomeTab(),
    ProductsTab(),
    const FavouritesTab(),
    const ProfileTab()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: ColorManager.white,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        child: BottomNavigationBar(
            backgroundColor: ColorManager.primary,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorManager.primary,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: currentIndex,
            onTap: (val) {
              currentIndex = val;
              setState(() {});
            },
            items: [
              CustomBottomNavBarItem(IconAssets.icHome, 'Home'),
              CustomBottomNavBarItem(IconAssets.icCategory, 'Category'),
              CustomBottomNavBarItem(IconAssets.icFavourite, 'Fav'),
              CustomBottomNavBarItem(IconAssets.icProfile, 'Profile'),
            ]),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(IconAssets.routeBlueIcon),
        backgroundColor: ColorManager.white,
      ),
      body: tabs[currentIndex],
    );
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
            label: title,
            icon: ImageIcon(
              size: 37.sp,
              AssetImage(iconPath),
              color: ColorManager.white,
            ),
            activeIcon: CircleAvatar(
              backgroundColor: ColorManager.white,
              child: ImageIcon(
                AssetImage(iconPath),
                color: ColorManager.primary,
              ),
            ));
}
