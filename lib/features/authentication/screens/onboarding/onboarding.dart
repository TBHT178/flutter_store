import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:flutter_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:flutter_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:flutter_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter_store/utils/constants/colors.dart';
import 'package:flutter_store/utils/constants/image_strings.dart';
import 'package:flutter_store/utils/constants/sizes.dart';
import 'package:flutter_store/utils/constants/text_strings.dart';
import 'package:flutter_store/utils/device/device_utility.dart';
import 'package:flutter_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/onboarding/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // create new instance of controller
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //  Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: CustomImages.onBoardingImage1,
                title: CustomTexts.onBoardingTitle1,
                subTitle: CustomTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: CustomImages.onBoardingImage2,
                title: CustomTexts.onBoardingTitle2,
                subTitle: CustomTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: CustomImages.onBoardingImage3,
                title: CustomTexts.onBoardingTitle3,
                subTitle: CustomTexts.onBoardingSubTitle3,
              )
            ],
          ),

          //  Skip Button
          const OnBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          //  Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }

  widget({required OnBoardingSkip child}) async {}
}




