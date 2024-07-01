import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_store/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../navigation_menu.dart';
import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.offAll(const NavigationMenu()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
