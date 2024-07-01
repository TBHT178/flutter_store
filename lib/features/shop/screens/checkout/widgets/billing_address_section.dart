import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_store/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){},),
        Text('Tran Bao Huyen Tram', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems / 2,),
            Text('+8496 202 2184', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16,),
            const SizedBox(width: TSizes.spaceBtwItems / 2,),
            Expanded(child: Text('Ho Chi Minh City, Vietnam', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,),),
          ],
        )
      ],
    );
  }
}
