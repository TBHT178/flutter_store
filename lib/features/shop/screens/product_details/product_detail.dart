import 'package:flutter/material.dart';
import 'package:flutter_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_store/utils/constants/sizes.dart';
import 'package:flutter_store/utils/helpers/helper_functions.dart';

import '../../../shop/screens/product_details/widgets/product_detail_image_slider.dart';
import '../../../shop/screens/product_details/widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. Product Image Slider
            TProductImageSlider(),

            /// 2. Product Details
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating and Share button
                  TRatingandShare(),

                  /// - Price, Title, Stock and Brand
                  TProductMetaData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

