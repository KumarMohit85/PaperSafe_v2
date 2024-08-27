import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/image_paths.dart';
import 'package:paper_safe_v2/core/pallete.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: ColorPallete.white,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 0.08 * width),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Spacer(
                flex: 3,
              ),
              Flexible(
                  flex: 3,
                  child: Text(
                    "Settings",
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
                  )),
              Spacer(
                flex: 1,
              ),
              Flexible(
                  flex: 2,
                  child: Text(
                    "App Preferences",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                  )),
              Spacer(
                flex: 1,
              ),
              getListButton("Secuirity", () {}),
              Spacer(
                flex: 1,
              ),
              getListButton("Delete Documents", () {}),
              Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 1,
                child: Divider(
                  thickness: 3,
                  color: ColorPallete.primary,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Flexible(
                  flex: 2,
                  child: Text(
                    "Need Help?",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                  )),
              Spacer(
                flex: 1,
              ),
              getListButton("FAQs", () {}),
              Spacer(
                flex: 1,
              ),
              getListButton("Chat With Us", () {}),
              Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 1,
                child: Divider(
                  thickness: 3,
                  color: ColorPallete.primary,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              getListButton("Privacy Policy", () {}, isBold: true),
              Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 1,
                child: Divider(
                  thickness: 3,
                  color: ColorPallete.primary,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              getListButton("Terms and Conditions", () {}, isBold: true),
              Spacer(
                flex: 2,
              ),
              Flexible(
                  flex: 7,
                  child:
                      Center(child: Image.asset(ImagePaths.darkOutlineLogo))),
              Flexible(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "Thank you for using PaperSafe",
                      style: TextStyle(fontSize: 16),
                    ),
                  ))
            ])));
  }

  Widget getListButton(String title, VoidCallback onPressed,
      {bool isBold = false}) {
    return Flexible(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: isBold ? FontWeight.w600 : FontWeight.w300),
            ),
            IconButton(onPressed: onPressed, icon: Icon(CupertinoIcons.forward))
          ],
        ));
  }
}
