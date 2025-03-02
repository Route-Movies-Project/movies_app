import 'package:flutter/material.dart';
import 'package:movies_app/core/Themes/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: ThemeColors.yellow,
            thickness: 1,
            indent: 40,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "OR",
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: ThemeColors.yellow,
            thickness: 1,
            endIndent: 40,
          ),
        ),
      ],
    );
  }
}
