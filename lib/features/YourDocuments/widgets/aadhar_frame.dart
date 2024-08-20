import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/image_paths.dart';

class AadharFrame extends StatelessWidget {
  const AadharFrame({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: SvgPicture.asset(
            kIsWeb
                ? ImagePaths.aadharCardFrameSvgWeb
                : ImagePaths.aadharCardFrameSvg,
            // fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
