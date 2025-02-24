import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {required this.onPressed,
      required this.child,
      this.buttonStyle,
      super.key});
  final void Function() onPressed;
  final Widget? child;
  final ButtonStyle? buttonStyle;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: child,
    );
  }
}
