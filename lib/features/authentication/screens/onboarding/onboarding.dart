import 'package:college/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:college/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:college/utils/constants/colors.dart';
import 'package:college/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:college/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:college/utils/constants/sizes.dart';
import 'package:college/utils/device/device_utility.dart';
import 'package:college/utils/helpers/helper_functions.dart';





class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndex,
            children: const [
              OnBoardingPage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subTitle: TTexts.onBoardingSubTitle1), // Column

              OnBoardingPage(
                  image: TImages.onBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subTitle: TTexts.onBoardingSubTitle2), // Column

              OnBoardingPage(
                  image: TImages.onBoardingImage3,
                  title: TTexts.onBoardingTitle3,
                  subTitle: TTexts.onBoardingSubTitle3), // Column
            ],
          ),

          // PageView

          // Skip Button
          const OnBoardingSkip(),
          // Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          // Circular Button
          const OnBoardingNextButton(), // Position

          
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  final dark= THelperFunctions.isDarkMode(context);
    return Positioned(
       right: TSizes.defaultSpace,
       bottom: TDeviceUtils.getBottomNavigationBarHeight(),
       child: ElevatedButton(
            onPressed: () => OnBoardingController.instance.nextPage(),
           style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark? TColors.primary: Colors.black,
               ),
            child: const Icon(Iconsax.arrow_right_3),
  ), // ElevatedButton
);
  }
}






