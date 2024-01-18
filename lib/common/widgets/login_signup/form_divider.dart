import 'package:college/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:college/utils/constants/text_strings.dart';
import 'package:college/utils/helpers/helper_functions.dart';



class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dividertext,
  });

  final String dividertext;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Flexible(
         child: Divider(
               color: dark ? TColors.darkGrey : TColors.grey,
               thickness: 0.5,
                indent: 60,
                endIndent: 5,
               ),
       ),
       Text(TTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium,),
       Flexible(
         child: Divider(
               color: dark ? TColors.darkGrey : TColors.grey,
               thickness: 0.5,
                indent: 5,
                endIndent: 60,
               ),
       ),
            ],
       );
  }
}