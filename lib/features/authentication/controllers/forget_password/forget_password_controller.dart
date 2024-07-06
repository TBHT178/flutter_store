import 'package:flutter/cupertino.dart';
import 'package:flutter_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async{
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      // Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();
      
      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email sent', message: 'Email Link sent to Reset your Password.'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      // Show some generic error to user
      TLoaders.errorSnackBar(title: 'Oh Snap! ', message: e.toString());
    }
  }

  /// Re-send Reset Password Email
  resendPasswordResetEmail(String email) async{
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.docerAnimation);

      // Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email sent', message: 'Email Link sent to Reset your Password.'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email));
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      // Show some generic error to user
      TLoaders.errorSnackBar(title: 'Oh Snap! ', message: e.toString());
    }
  }
}