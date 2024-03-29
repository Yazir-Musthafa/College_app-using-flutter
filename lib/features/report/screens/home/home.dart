import 'package:flutter/material.dart';
import 'package:college/common/widgets/custom_shapes/containers/primary_header_container.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Container(),
            ), // TPrimaryHeaderContainer
            const SizedBox(height: 1), // Added a SizedBox with a height of 1
          ], // Fixed the syntax error here
        ), // Column
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
