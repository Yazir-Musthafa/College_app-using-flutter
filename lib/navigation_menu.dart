import 'package:college/features/personalization/screens/settings/settings.dart';
import 'package:college/features/report/screens/home/home.dart';
import 'package:college/utils/constants/colors.dart';
import 'package:college/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,

          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.add), label: 'Report'),
            NavigationDestination(icon: Icon(Iconsax.driver1), label: 'Your Reports'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ), // NavigationBar
      ), // Obx
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    ); // Scaffold
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
    const SettingsScreen(),
  ];
}





