import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/features/authentication/screens/signup/signup.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: CustomSizes.spaceBtwSections),
          child: Column(
            children: [
              /// Email
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: CustomTexts.email,
                ),
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwInputFields,
              ),

              /// Password
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: CustomTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields / 2),

              /// Remember Me & Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Remember Me
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const Text((CustomTexts.rememberMe)),
                    ],
                  ),

                  /// Forget Password
                  TextButton(
                      onPressed: () {},
                      child: const Text(CustomTexts.forgetPassword))
                ],
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),

              /// Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(CustomTexts.signIn))),
              const SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),

              /// Create Account Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const SignupScreen()),
                      child: const Text(CustomTexts.createAccount))),
            ],
          ),
        ));
  }
}