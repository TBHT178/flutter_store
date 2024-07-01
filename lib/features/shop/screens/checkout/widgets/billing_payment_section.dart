import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_store/utils/constants/colors.dart';
import 'package:flutter_store/utils/constants/image_strings.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TPaymentAddressSection extends StatelessWidget {
  const TPaymentAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){},),
        const SizedBox(height: TSizes.spaceBtwItems/ 2,),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 34,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage(TImages.paypal), fit: BoxFit.contain,),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/ 2,),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}
