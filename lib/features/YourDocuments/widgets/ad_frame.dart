import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/pallete.dart';

class AdFrame extends StatelessWidget {
  const AdFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: AspectRatio(
        aspectRatio: 2,
        child: Container(
          decoration: BoxDecoration(
              color: ColorPallete.grey,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text("Ad"),
          ),
        ),
      ),
    );
  }
}
