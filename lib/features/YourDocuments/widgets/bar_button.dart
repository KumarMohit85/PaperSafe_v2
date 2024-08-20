import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/pallete.dart';

class BarButton extends StatelessWidget {
  const BarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4.4,
      child: Container(
        decoration: BoxDecoration(
            color: ColorPallete.lightPrimary,
            borderRadius: BorderRadius.circular(40)),
        child: Center(
          child: Text("bar button"),
        ),
      ),
    );
  }
}
