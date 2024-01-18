import 'package:college/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:college/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:college/common/widgets/custom_shapes/containers/circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: TColors.primary,
        child: Stack(
          children: [
            // Background Custom Shapes
            Positioned(top: -150, right: -250, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
            Positioned(top: 100, right: -300, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
            child,
          ], // Stack
        ), // Container
      ), // TCurvedEdgesWidget
    );
  }
}
