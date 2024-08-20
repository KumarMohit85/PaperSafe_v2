import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/image_paths.dart';

class PanFrame extends StatelessWidget {
  const PanFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: SvgPicture.asset(kIsWeb
              ? ImagePaths.panCardFrameSvgWeb
              : ImagePaths.panCardFrameSvg),
        ),
      ),
    );
  }
}
