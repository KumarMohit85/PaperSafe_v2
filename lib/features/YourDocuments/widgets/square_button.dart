import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/pallete.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
            color: ColorPallete.lightLightPrimary,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
