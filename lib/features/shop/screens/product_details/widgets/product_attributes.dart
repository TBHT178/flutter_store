import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/chips/choice_chip.dart';
import 'package:flutter_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_store/common/widgets/texts/product_price_text.dart';
import 'package:flutter_store/common/widgets/texts/product_title_text.dart';
import 'package:flutter_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_store/utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected attribute Pricing and Description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock Status
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          const TProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              /// Variation Description
              const TProductTitleText(
                title:
                'Description of the Product and it can go upto max 4 lines',
                maxLines: 4,
                smallSize: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        /// -- Attributes
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const TSectionHeading(title: 'Colors', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems / 2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'Blue', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'Yellow', selected: false, onSelected: (value){},),
              ],
            ),
          ],
         ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size', showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems / 2,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'EU 36', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'EU 38', selected: false, onSelected: (value){},),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
