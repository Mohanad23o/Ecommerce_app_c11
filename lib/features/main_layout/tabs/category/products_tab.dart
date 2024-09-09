import 'package:e_commerce_app_c11/domain/entities/product_response_entity.dart';
import 'package:e_commerce_app_c11/features/main_layout/screens/product_details_screen.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/category/cubit/product_state.dart';
import 'package:e_commerce_app_c11/features/main_layout/tabs/category/cubit/products_screen_view_model.dart';
import 'package:e_commerce_app_c11/features/main_layout/widgets/custom_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../widgets/custom_search_bar.dart';

class ProductsTab extends StatelessWidget {
  ProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSearchBar(cartItemCount: 0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: SizedBox(
                height: 750.h,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: BlocProvider.of<ProductsScreenViewModel>(context)
                      .productList
                      ?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return BlocBuilder<ProductsScreenViewModel, ProductState>(
                      bloc: BlocProvider.of<ProductsScreenViewModel>(context)
                        ..getAllProducts()
                        ..changeItemCount(),
                      builder: (context, state) {
                        if (state is ProductLoadingState) {
                          return Skeletonizer(
                            enabled: true,
                            child: CustomProductItemWidget(
                              productEntity: ProductEntity(),
                            ),
                          );
                        } else if (state is ProductErrorState) {
                          return Center(
                            child: Text(state.errorMessage),
                          );
                        } else if (state is ProductSuccessState) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: InkWell(
                              key: ValueKey(
                                  state.productResponseEntity.data![index].id),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                      product: state
                                          .productResponseEntity.data![index],
                                    ),
                                  ),
                                );
                              },
                              child: CustomProductItemWidget(
                                productEntity:
                                    state.productResponseEntity.data![index],
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
