
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TermAndConditionCheckbox extends StatelessWidget {
  const TermAndConditionCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            height: 24,
            width: 24,
            child:
            Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(width: CustomSizes.spaceBtwItems,),
        Text.rich(
            TextSpan(children: [
              TextSpan(text: '${CustomTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '${CustomTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? CustomColors.white : CustomColors.primary
              )),
              TextSpan(text: '${CustomTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: CustomTexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? CustomColors.white : CustomColors.primary
              )),
            ])
        ),
      ],
    );
  }
}