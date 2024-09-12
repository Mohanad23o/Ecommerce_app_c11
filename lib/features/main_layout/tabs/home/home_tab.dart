import 'package:e_commerce_app_c11/core/resources/app_constants.dart';
import 'package:e_commerce_app_c11/di/di.dart';
import 'package:e_commerce_app_c11/features/main_layout/cubit/home_screen_view_model.dart';
import 'package:e_commerce_app_c11/features/main_layout/cubit/home_tab_state.dart';
import 'package:e_commerce_app_c11/features/main_layout/widgets/custom_brand_or_category_widget.dart';
import 'package:e_commerce_app_c11/features/main_layout/widgets/custom_search_bar.dart';
import 'package:e_commerce_app_c11/features/main_layout/widgets/custom_section_bar.dart';
import 'package:e_commerce_app_c11/features/main_layout/widgets/custom_slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSearchBar(
              cartItemCount: 0,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              padding: EdgeInsets.all(16.sp),
              child: CustomSlideShow(),
            ),
            SizedBox(height: 8.h),
            CustomSectionBar(sectionName: AppConstants.category),
            SizedBox(
                height: 270.h,
                child: BlocBuilder(
                    bloc: viewModel..getAllCategories(),
                    builder: (context, state) {
                      if (state is HomeTabLoadingState) {
                        return GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, itemIndex) {
                              return Skeletonizer(
                                enabled: true,
                                child: CustomBrandOrCategoryWidget(
                                    imagePath: viewModel
                                            .categoryList?[itemIndex].image ??
                                        '',
                                    title: viewModel
                                            .categoryList?[itemIndex].name ??
                                        ''),
                              );
                            });
                      } else if (state is HomeTabErrorState) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      } else if (state is HomeTabSuccessState) {
                        return Skeletonizer(
                          enabled: false,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.categoryList?.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, itemIndex) {
                                return CustomBrandOrCategoryWidget(
                                    imagePath: viewModel
                                            .categoryList?[itemIndex].image ??
                                        '',
                                    title: viewModel
                                            .categoryList?[itemIndex].name ??
                                        '');
                              }),
                        );
                      }
                      return Container();
                    })), // todo:categories
            SizedBox(
              height: 20.h,
            ),
            CustomSectionBar(sectionName: AppConstants.brand),
            SizedBox(
                height: 270.h,
                child: BlocBuilder(
                    bloc: viewModel..getAllBrands(),
                    builder: (context, state) {
                      if (state is HomeTabLoadingState) {
                        return GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, itemIndex) {
                              return Skeletonizer(
                                enabled: true,
                                child: CustomBrandOrCategoryWidget(
                                    imagePath: viewModel
                                            .brandsList?[itemIndex].image ??
                                        '',
                                    title:
                                        viewModel.brandsList?[itemIndex].name ??
                                            ''),
                              );
                            });
                      } else if (state is HomeTabErrorState) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      } else if (state is HomeTabSuccessState) {
                        return Skeletonizer(
                          enabled: false,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.brandsList?.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, itemIndex) {
                                return CustomBrandOrCategoryWidget(
                                    imagePath: viewModel
                                            .brandsList?[itemIndex].image! ??
                                        '',
                                    title: viewModel
                                            .brandsList?[itemIndex].name! ??
                                        '');
                              }),
                        );
                      }
                      return Container();
                    })), // todo:Brands
          ],
        ),
      ),
    );
  }
}
