import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/common/widgets/login_signup/form_divider.dart';
import 'package:flutter_store/common/widgets/login_signup/social_buttons.dart';
import 'package:flutter_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter_store/utils/constants/colors.dart';
import 'package:flutter_store/utils/constants/sizes.dart';
import 'package:flutter_store/utils/constants/text_strings.dart';
import 'package:flutter_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                CustomTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),

              /// Form
              const CustomSignupForm(),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),

              /// Divider
              CustomFormDivider(dividerText: CustomTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),

              /// Social Button
              const CustomSocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}


