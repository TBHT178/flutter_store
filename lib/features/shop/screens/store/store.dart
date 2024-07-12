import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_store/common/widgets/appbar/tabbar.dart';
import 'package:flutter_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutter_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_store/features/shop/controllers/category_controller.dart';
import 'package:flutter_store/features/shop/screens/brand/all_brands.dart';
import 'package:flutter_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_store/utils/constants/colors.dart';
import 'package:flutter_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// -- Search bar
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        const TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        /// -- Featured brand
                        TSectionHeading(
                          title: 'Featured Brands',
                          onPressed: () => Get.to(() => const AllBrandsScreen()),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),

                        /// -- Brands GRID
                        TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const TBrandCard(
                              showBorder: true,
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  /// Tabs --Tutorial (Section #3, video #8
                  bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                  ),
              ),
            ];
          },

          /// --Body --Tutorial (Section #3, video #8
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category,)).toList()
          ),
        ),
      ),
    );
  }
}


