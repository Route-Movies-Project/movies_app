import 'package:flutter/material.dart';

class CustomDecorationImage extends StatelessWidget {
  const CustomDecorationImage({
    required this.imageName,
    this.child,
    super.key,
  });
  final String imageName;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageName),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
