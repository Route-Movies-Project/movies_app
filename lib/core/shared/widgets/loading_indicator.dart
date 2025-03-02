import 'package:flutter/material.dart';
import 'package:movies_app/core/Themes/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({this.color = ThemeColors.yellow, super.key});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
