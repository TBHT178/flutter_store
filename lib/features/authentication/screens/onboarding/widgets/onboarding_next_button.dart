import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = CustomHelperFunctions.isDarkMode(context);

    return Positioned(
        right: CustomSizes.defaultSpace,
        bottom: CustomDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? CustomColors.primary : Colors.black
          ),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}