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
  }

  Widget getTextField(
      String title, double w, TextEditingController controller) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
      Container(
        width: w,
        child: TextFormField(
          controller: controller,
          style: TextStyle(
              fontSize: 18, letterSpacing: 1.4, fontWeight: FontWeight.w500),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    BorderSide(width: 2, color: ColorPallete.lightPrimary)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 4, color: ColorPallete.primary)),
          ),
        ),
      )
    ]);
  }

  Widget getSelectedContainer(Widget child, bool isActive, double w1, double w2,
      double h1, double h2, double r) {
    return isActive
        ? Container(
            height: h1,
            width: w1,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: ColorPallete.primary,
                ),
                borderRadius: BorderRadius.circular(r)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: h2,
                width: w2,
                decoration: BoxDecoration(
                    color: ColorPallete.lightPrimary,
                    borderRadius: BorderRadius.circular(r)),
                child: Center(child: child),
              ),
            ),
          )
        : Container(
            height: h2,
            width: w2,
            decoration: BoxDecoration(
                color: ColorPallete.grey,
                borderRadius: BorderRadius.circular(r)),
            child: Center(child: child),
          );
  }
}
