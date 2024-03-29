import 'package:college/features/authentication/screens/login/login.dart';
import 'package:college/features/authentication/screens/onboarding/onboarding.dart';
import 'package:college/features/authentication/screens/signup/verify_email.dart';
import 'package:college/navigation_menu.dart';
import 'package:college/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:college/utils/exceptions/firebase_exceptions.dart';
import 'package:college/utils/exceptions/format_exceptions.dart';
import 'package:college/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart'; 

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
   screenRedirect() async {
    final user = _auth.currentUser;

    if(user != null)
    {
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      }
      else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email ));
      }
    }
    else{
    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);

    if (deviceStorage.read('IsFirstTime') != true) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(const OnBoardingScreen());
    }
  }
   }

  /* Email & Password sign-in */

  //registration is here man 
   Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
  try {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
     }
    }

   
Future<void> sendEmailVerification() async {
  try {
    await _auth.currentUser?.sendEmailVerification();
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}

//logout
/// [LogoutUser] - Valid for any authentication.
Future<void> logout() async {
  try {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginScreen());
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}

    



}
