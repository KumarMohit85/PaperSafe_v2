import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/pallete.dart';

class StartDrawer extends StatefulWidget {
  const StartDrawer({super.key});

  @override
  State<StartDrawer> createState() => _StartDrawerState();
}

class _StartDrawerState extends State<StartDrawer> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: ColorPallete.white,
      width: kIsWeb ? width * 0.1 : width * 0.7,
    );
  }
}
