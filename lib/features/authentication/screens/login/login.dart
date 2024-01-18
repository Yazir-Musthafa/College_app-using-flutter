import 'package:flutter/material.dart';
import 'package:college/common/styles/spacing_styles.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'package:college/features/authentication/screens/login/widgets/login_form.dart';
import 'package:college/features/authentication/screens/login/widgets/login_header.dart';
import 'package:college/common/widgets/login_signup/form_divider.dart';
import 'package:college/common/widgets/login_signup/social_buttons.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title & Sub-Title
              const TLoginHeader(), // Column

              // Form
              const TLoginForm(),

              // Divider
            TFormDivider(dividertext: TTexts.orSignInWith.capitalize!), 

              const SizedBox(height: TSizes.spaceBtwSections),

// Footer
             const TSocialButtons(), // Row



            ],
          ),
        ),
      ),
    );
  }
}








