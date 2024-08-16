import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/common_widgets.dart';
import 'package:paper_safe_v2/core/image_paths.dart';
import 'package:paper_safe_v2/core/pallete.dart';
import 'package:paper_safe_v2/core/structs.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController controller = TextEditingController();
  gender _selectedGender = gender.male;
  userType _selectedUser = userType.student;
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
        // color: ColorPallete.lightGreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kIsWeb ? height * 0.03 : height * 0.05,
            ),
            Flexible(
                flex: 1,
                child: Text(
                  "Tell us more about you",
                  style: TextStyle(
                      fontSize: 48, fontWeight: FontWeight.w700, height: 1),
                )),
            SizedBox(
              height: height * 0.02,
            ),
            Flexible(
                flex: 1,
                child: CommonWidgets().getTextField("First Name",
                    kIsWeb ? width * 0.25 : width * 0.78, controller)),
            SizedBox(
              height: height * 0.01,
            ),
            Flexible(
                flex: 1,
                child: CommonWidgets().getTextField("Last Name",
                    kIsWeb ? width * 0.25 : width * 0.78, controller)),
            SizedBox(
              height: height * 0.01,
            ),
            Flexible(
                flex: 1,
                child: CommonWidgets().getTextField("Mobile No.",
                    kIsWeb ? width * 0.25 : width * 0.78, controller)),
            SizedBox(
              height: height * 0.01,
            ),
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
                )),
            SizedBox(
              height: height * 0.01,
            ),
            Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Text("Gender"),
                    ),
                    Row(
                      children: gender.values.map((gender g) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedGender = g;
                              });
                            },
                            child: CommonWidgets().getSelectedContainer(
                                Text(g.toString().split('.').last),
                                _selectedGender == g,
                                kIsWeb ? width * 0.1 : width * 0.24,
                                kIsWeb ? width * 0.09 : width * 0.22,
                                height * 0.06,
                                height * 0.065,
                                30),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                )),
            SizedBox(
              height: height * 0.01,
            ),
            Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Text("You are a ? "),
                    ),
                    Row(
                      children: userType.values.map((userType user) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedUser = user;
                                  });
                                },
                                child: CommonWidgets().getSelectedContainer(
                                    SvgPicture.asset(
                                      _getImagePath(user, kIsWeb),
                                      fit: BoxFit.contain,
                                    ),
                                    _selectedUser == user,
                                    kIsWeb ? width * 0.1 : width * 0.23,
                                    kIsWeb ? width * 0.1 : width * 0.23,
                                    kIsWeb ? height * 0.15 : height * 0.1, //h1
                                    kIsWeb ? height * 0.15 : height * 0.1, //h2
                                    10),
                              ),
                              Text(user.toString().split('.').last)
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  String _getImagePath(userType user, bool isWeb) {
    switch (user) {
      case userType.student:
        return isWeb ? ImagePaths.studentSvgWeb : ImagePaths.studentSvg;
      case userType.professional:
        return isWeb
            ? ImagePaths.professionalSvgWeb
            : ImagePaths.professionalSvg;
      case userType.other:
        return isWeb ? ImagePaths.otherSvgWeb : ImagePaths.otherSvg;
    }
  }
}
