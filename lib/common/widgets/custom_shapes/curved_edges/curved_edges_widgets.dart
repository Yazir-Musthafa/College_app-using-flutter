import 'package:flutter/material.dart';
import 'package:college/common/widgets/custom_shapes/curved_edges/curved_edges.dart';


class TCurvedEdgesWidget extends StatelessWidget {
  const TCurvedEdgesWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(), // Corrected class name
      child: child,
    );
  }
}
