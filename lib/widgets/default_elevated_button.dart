import 'package:flutter/material.dart';
import 'package:movies_app/core/Themes/colors.dart';

class DefaultElevatedButton extends StatelessWidget {
  DefaultElevatedButton({
    required this.label,
   required this.onPressed});

  String label;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton
    (onPressed: onPressed,
    style: ElevatedButton.styleFrom(fixedSize:
     Size(MediaQuery.sizeOf(context).width, 56)),
     child: Text('Create Account',style:TextStyle(color: ThemeColors.black, fontSize: 20, fontWeight: FontWeight.w400)
     ));
  }
}