import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch -- Shortcut: Ctrl + o
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {

    if (kDebugMode) {
      print('----- Get Storage Auth Repo -----');
      print(deviceStorage.read('isFirstTime'));
    }

    deviceStorage.writeIfNull('isFirstTime', true);

    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
  }

/*------------------------------- Email & Password Sign-in -------------------------------*/

  /// [EmailAuthentication] - SignIn

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    // } on FirebaseAuthException catch(e){
    //   throw TFirebaseAuthException(e.code).message;
    // } on FirebaseException catch(e){
    //   throw TFirebaseAuthException(e.code).message;
    } on FormatException catch(_){
      throw FormatException;
    // } on PlatformException catch(e){
    //   throw TFirebaseAuthException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailVerification] - Mail Verification

  /// [EmailAuthentication] - Forget password

/*------------------------------- Federated identity & social sign-in -------------------------------*/

  /// [GoogleAuthentication] - GOOGLE

  /// [FacebookAuthentication] - FACEBOOK

/*------------------------------- Federated identity & social sign-in -------------------------------*/

  /// [LogoutUser] - Valid for any authentication

  /// Delete User - Remove user Auth and FireStore Account
}
