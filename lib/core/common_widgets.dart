import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/image_paths.dart';
import 'package:paper_safe_v2/core/pallete.dart';

class CommonWidgets {
  Widget getButton(
      {required String title,
      required double h,
      required double w,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
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
    String title,
    String hint,
    double w,
    TextEditingController controller,
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(
        child: Container(
          width: w,
          child: TextFormField(
            controller: controller,
            style: TextStyle(
                fontSize: 18, letterSpacing: 1.4, fontWeight: FontWeight.w500),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: ColorPallete.greyText),
              filled: true,
              fillColor: Colors.grey[200],
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      BorderSide(width: 2, color: ColorPallete.lightPrimary)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      BorderSide(width: 4, color: ColorPallete.primary)),
            ),
          ),
        ),
      )
    ]);
  }

  Widget getSelectedContainer(Widget child, bool isActive, double w1, double w2,
      double h1, double h2, double r,
      {String title = ""}) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
      isActive
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
            ),
    ]);
  }

  Widget getBarButton(
      {required double height,
      required String title,
      required String svgPath}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: ColorPallete.lightLightPrimary,
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          Spacer(
            flex: 1,
          ),
          Flexible(
              flex: 3,
              child: AspectRatio(
                aspectRatio: 0.8,
                child: SvgPicture.asset(svgPath),
              )),
          Spacer(
            flex: 1,
          ),
          Flexible(
              flex: 6,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: ColorPallete.primary),
              ))
        ],
      ),
    );
  }

  Widget getSquareButton({required String title, required String svgPath}) {
    return AspectRatio(
        aspectRatio: 1.1,
        child: Container(
          decoration: BoxDecoration(
              color: ColorPallete.lightLightPrimary,
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    flex: 3,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: SvgPicture.asset(svgPath),
                    )),
                Flexible(
                  flex: 2,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget getIconButton(
      {required bool isActive,
      required IconData icon,
      required VoidCallback onPressed}) {
    return Container(
      decoration:
          BoxDecoration(color: isActive ? ColorPallete.highlight : null),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 40,
            color: ColorPallete.primary,
          )),
    );
  }
}
