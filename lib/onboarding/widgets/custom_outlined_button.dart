import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {required this.onPressed,
      required this.child,
      this.buttonStyle,
      super.key});
  final void Function()? onPressed;
  final Widget? child;
  final ButtonStyle? buttonStyle;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: child,
    );
  }
}
