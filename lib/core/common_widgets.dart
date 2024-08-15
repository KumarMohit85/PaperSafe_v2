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
}
