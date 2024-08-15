import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/pallete.dart';

class CommonWidgets {
  Widget getButton(
      {required String title,
      required double h,
      required double w,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap
      // () {
      //
      // }
      ,
      child: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            color: ColorPallete.primary,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
        )),
      ),
    );
    ;
  }
}
