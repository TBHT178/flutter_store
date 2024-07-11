import 'package:flutter/cupertino.dart';
import 'package:flutter_store/data/repositories/user/user_repository.dart';
import 'package:flutter_store/features/personalization/controller/user_controller.dart';
import 'package:flutter_store/features/personalization/screens/profile/profile.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// Init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'Processing your request...', TImages.docerAnimation);

      // Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in Firebase FireStore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated.');

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      // Show some generic error to user
      TLoaders.errorSnackBar(title: 'Oh Snap! ', message: e.toString());
    }
  }
}
