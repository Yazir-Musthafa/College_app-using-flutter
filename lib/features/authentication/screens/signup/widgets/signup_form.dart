import 'package:college/features/authentication/controllers/signup/signup_controller.dart';
// ignore: unused_import
import 'package:college/features/authentication/screens/signup/verify_email.dart';
import 'package:college/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:college/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:college/utils/constants/text_strings.dart';
import '../../../../../../utils/constants/sizes.dart';


class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

 
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText('firstName', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText('lastName', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          /// Username
          TextFormField(
            controller: controller.username,
            validator: (value) => TValidator.validateEmptyText('username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          /// Password
         Obx(
           () =>  TextFormField(
                   validator: (value) => TValidator.validatePassword(value),
           controller: controller.password,
           obscureText: controller.hidepassword.value,
           decoration: InputDecoration(
                   labelText: TTexts.password,
           prefixIcon: const Icon(Iconsax.password_check),
           suffixIcon: IconButton(
            onPressed: () => controller.hidepassword.value = !controller.hidepassword.value,
             icon: Icon( controller.hidepassword.value ? Iconsax.eye_slash : Iconsax.eye),
             ),
              ),
            ),
         ),

          const SizedBox(height: TSizes.spaceBtwSections),
          /// Terms & Conditions Checkbox
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),
          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup() ,
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

