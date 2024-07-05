class TPlatformException implements Exception{
  final String code;
  TPlatformException(this.code);

  String get message {
    switch (code){
      case 'INVALID_LOGIN_CREDENTIALS' :
        return 'Invalid login credentials. Please double check your information.';
      case 'too-many-requests' :
        return 'Too many request. Please try again later.' ;
      case 'invalid-argument' :
        return 'Invalid argument provided to the authentication method.';
      case 'sign_in_failed' :
        return 'Sign-in failed. Please try again.';
      case 'invalid-custom-token' :
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'custom-token-mismatch' :
        return 'The custom token corresponds to a different audience.';
      case 'captcha-checked-failed' :
        return 'The reCAPTCHA response is invalid. Please try again.';
      case 'app-not-authorized' :
        return 'The app is not authorized to use Firebase Authentication with th provided API key.';
      case 'keychain-error' :
        return 'A keychain error occurred. Please check the keychain and try again.';
      case 'email-already-in-use' :
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification id. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exists':
        return 'The email address is already exists. Please use a different email.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'requires-recent-login':
        return 'This operations is sensitive and requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously sign in user.';
      default:
        return 'An unknown platform error occurred. Please try again.';
    }
  }
}
