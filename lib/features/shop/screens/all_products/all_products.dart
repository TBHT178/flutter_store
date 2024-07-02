import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:flutter_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Popular Products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                  onChanged: (value) {},
                  items: [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularity'
                  ]
                      .map((option) =>
                      DropdownMenuItem(value: option,child: Text(option),))
                      .toList(),
                  ),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Products
              TGridLayout(itemCount: 6, itemBuilder: (_, index) => const TProductCardVertical()),


            ],
          ),
        ),
      ),
    );
  }
}
