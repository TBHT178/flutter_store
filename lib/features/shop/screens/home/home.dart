import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:flutter_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_store/features/shop/controllers/product_controller.dart';
import 'package:flutter_store/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flutter_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter_store/utils/constants/image_strings.dart';
import 'package:flutter_store/utils/constants/sizes.dart';
import 'package:flutter_store/utils/dummydata/dummy_data.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// -- Searchbar
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// -- Categories Bar
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        /// -- Categories
                        THomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),



            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  const TPromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Heading
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// -- Popular Products
                  Obx(() {
                    if(controller.isLoading.value) return const TVerticalProductShimmer();

                    if(controller.featuredProducts.isEmpty){
                      return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium,));
                    }

                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),

                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}


//       appBar: AppBar(
//         title: Text('Upload Dummy Data'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             try {
//               await controller.uploadDummyData(TDummyData.products);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Data uploaded successfully!')),
//               );
//             } catch (e) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Failed to upload data: $e')),
//               );
//             }
//           },
//           child: Text('Upload Data'),
//         ),
//       ),
//     );
//   }
// }
