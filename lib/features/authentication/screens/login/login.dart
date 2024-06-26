import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/common/styles/spacing_styles.dart';
import 'package:flutter_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter_store/utils/constants/colors.dart';
import 'package:flutter_store/utils/constants/image_strings.dart';
import 'package:flutter_store/utils/constants/sizes.dart';
import 'package:flutter_store/utils/constants/text_strings.dart';
import 'package:flutter_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyle.paddindWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title and Subtitle
              const CustomLoginHeader(),

              /// Form
              const CustomLoginForm(),

              /// Divider
              CustomFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Footer
              CustomSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}








