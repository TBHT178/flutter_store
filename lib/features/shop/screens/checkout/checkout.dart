import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_store/utils/constants/colors.dart';
import 'package:flutter_store/utils/constants/sizes.dart';
import 'package:flutter_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in Cart
              const TCartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Coupon TextField
              TRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.dark : TColors.white,
                padding: const EdgeInsets.only(
                    top: TSizes.sm,
                    bottom: TSizes.sm,
                    right: TSizes.sm,
                    left: TSizes.md),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Have a promo code? Enter here',
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
