import 'package:badges/badges.dart' as badges;
import 'package:e_commerce_app_c11/features/main_layout/screens/cart/cubit/cart_products_screen_view_model.dart';
import 'package:e_commerce_app_c11/features/main_layout/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/image_assets.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../domain/entities/product_response_entity.dart';
import '../../screens/product_details_screen.dart';
import '../../widgets/custom_product_item_widget.dart';
import 'cubit/product_state.dart';
import 'cubit/products_screen_view_model.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsScreenViewModel, ProductState>(
      bloc: BlocProvider.of<ProductsScreenViewModel>(context)..getAllProducts(),
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 45.w, left: 16.w),
                      child: SearchBar(
                        enabled: true,
                        side: WidgetStatePropertyAll(
                          BorderSide(width: 0.5, color: ColorManager.primary),
                        ),
                        elevation: WidgetStatePropertyAll(0),
                        hintText: 'What do you search for?',
                        onChanged: (val) {},
                        hintStyle: WidgetStatePropertyAll(
                          getLightStyle(
                            fontSize: FontSize.s14,
                            color: const Color(0xff06004F),
                          ),
                        ),
                        backgroundColor:
                            const WidgetStatePropertyAll(ColorManager.white),
                        leading: Image.asset(IconAssets.icSearch),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: ColorManager.primary,
                        padding: EdgeInsets.all(5.sp),
                      ),
                      position: badges.BadgePosition.topEnd(top: -10, end: -5),
                      badgeContent: Text(
                          '${CartProductsScreenViewModel.get(context).numOfItems}',
                          style: const TextStyle(color: Colors.white)),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.cartRoute);
                        },
                        icon: const ImageIcon(AssetImage(IconAssets.icCart)),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 8.h,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) => Skeletonizer(
                    enabled: true,
                    child: CustomProductItemWidget(
                      productEntity: ProductEntity(title: ''),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is ProductErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is ProductSuccessState) {
          final products = state.productResponseEntity.data ?? [];

          return Column(
            children: [
              CustomSearchBar(cartItemCount: 0),
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.w, // Increase spacing for better layout
                    mainAxisSpacing: 8.h,
                    childAspectRatio:
                        0.7, // Adjust aspect ratio for overflow prevention
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: InkWell(
                        key: ValueKey(product.id),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                product: product,
                              ),
                            ),
                          );
                        },
                        child: CustomProductItemWidget(
                          productEntity: product,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
