import 'package:college/data/repositories/authentication/authentication_repository.dart';
import 'package:college/data/repositories/user/user_repository.dart';
import 'package:college/features/authentication/screens/signup/verify_email.dart';
import 'package:college/features/personalization/models/user_model.dart';
import 'package:college/utils/constants/image_strings.dart';
import 'package:college/utils/helpers/network_manager.dart';
import 'package:college/utils/popups/full_screen_loader.dart';
import 'package:college/utils/popups/loaders.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidepassword = true.obs; //observable for hed and show pass
  final privacyPolicy = true.obs;
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber = TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

  /// -- SIGNUP
  void signup() async {
    try {
      
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
    
      // Form Validation
      if(!signupFormKey.currentState!.validate())  return;
      // Start Loading
      

      // Privacy Policy Check
      if(!privacyPolicy.value)
      { 
          
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In Order to create account, you must have to read and accept the Privacy Policy & terms of use'
          );
      }
     if(privacyPolicy.value)
     {
      TFullScreenLoader.openLoadingDialog('we are processing your information ...',TImages.docer);
      // Register user in the Firebase Authentication & Save user data in the Firebase
      final usercredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      // Save Authenticated user data in the Firebase Firestore
      final newuser = UserModel(id: usercredential.user!.uid, firstName: firstName.text.trim(), lastName: lastName.text.trim(),
       username: username.text.trim(), email: email.text.trim(), phoneNumber: phoneNumber.text.trim(), 
       profilePicture: "");
       final userRepository = Get.put(UserRepository());
       await userRepository.saveUserRecord(newuser);
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title:"Congratulations", message: "Your Account has been created! Verify Email to Continue.");
      // Move to verify Email screen 
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
     }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // Handle the error
      TLoaders.successSnackBar(title: 'Congratulations', message: e.toString());
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    }
  }
}



