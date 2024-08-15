import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/common_widgets.dart';
import 'package:paper_safe_v2/core/pallete.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorPallete.white,
      body: Container(
        width: width,
        margin: EdgeInsets.symmetric(
            horizontal: kIsWeb ? width * 0.3 : width * 0.1),
        color: ColorPallete.lightGreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 2,
                child: Text(
                  "Tell us more about you",
                  style: TextStyle(
                      fontSize: 48, fontWeight: FontWeight.w700, height: 1),
                )),
            SizedBox(
              height: height * 0.07,
            ),
            Flexible(
                flex: 1,
                child: CommonWidgets().getTextField("First Name",
                    kIsWeb ? width * 0.25 : width * 0.78, controller)),
            Flexible(
                flex: 1,
                child: CommonWidgets().getTextField("Last Name",
                    kIsWeb ? width * 0.25 : width * 0.78, controller)),
            Flexible(
                flex: 1,
                child: CommonWidgets().getTextField("Mobile No.",
                    kIsWeb ? width * 0.25 : width * 0.78, controller)),
            Flexible(
                flex: 1,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonWidgets().getTextField("Day",
                        kIsWeb ? width * 0.07 : width * 0.22, controller),
                    SizedBox(
                      width: kIsWeb ? width * 0.03 : width * 0.01,
                    ),
                    CommonWidgets().getTextField("Month",
                        kIsWeb ? width * 0.07 : width * 0.22, controller),
                    SizedBox(
                      width: kIsWeb ? width * 0.03 : width * 0.01,
                    ),
                    CommonWidgets().getTextField("Year",
                        kIsWeb ? width * 0.07 : width * 0.22, controller),
                    SizedBox(
                      width: kIsWeb ? width * 0.03 : width * 0.01,
                    ),
                    SizedBox(
                      width: kIsWeb ? width * 0.06 : width * 0.1,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.calendar,
                            size: 40,
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
