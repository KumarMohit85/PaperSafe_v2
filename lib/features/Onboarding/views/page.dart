import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/pallete.dart';

class Pages extends StatelessWidget {
  Pages(
      {super.key,
      required this.svgPath,
      required this.title,
      required this.subtitle,
      this.isActive = false});
  final String svgPath;
  final String title;
  final String subtitle;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.7,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(
            flex: 3,
          ),
          Expanded(flex: 9, child: SizedBox(child: SvgPicture.asset(svgPath))),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
