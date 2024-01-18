
import 'package:college/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:college/features/authentication/screens/signup/signup.dart';
import 'package:college/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:college/utils/constants/sizes.dart';
import 'package:college/utils/constants/text_strings.dart';
import 'package:get/get.dart';


class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.arrow_right),
                labelText: TTexts.email,
              ),
            ), // TextFormField
            const SizedBox(height: TSizes.spaceBtwInputFields),
      
            // Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.security),
                labelText: TTexts.password,
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
            ), // TextFormField
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
      
            // Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ), // Row
      
                // Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ), // Row
      
            const SizedBox(height: TSizes.spaceBtwSections),
      
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(()=> const NavigationMenu() ),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(()=> const SignupScreen()),
                child: const Text(TTexts.createAccount),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}