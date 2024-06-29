import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:flutter_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:flutter_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../shop/screens/product_details/widgets/product_detail_image_slider.dart';
import '../../../shop/screens/product_details/widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. Product Image Slider
            const TProductImageSlider(),

            /// 2. Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating and Share button
                  const TRatingandShare(),

                  /// - Price, Title, Stock and Brand
                  const TProductMetaData(),

                  /// - Attribute
                  const TProductAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// - Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// - Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'At the heart of Nike\'s success lies its relentless pursuit of innovative technologies. Nike Air cushioning, introduced in the late \'70s, revolutionized the industry by providing superior comfort and impact protection',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews (199)', showActionButton: false,),
                      IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3, size: 18,),),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
