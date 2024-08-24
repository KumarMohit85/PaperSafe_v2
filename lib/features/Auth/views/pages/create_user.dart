import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/common_widgets.dart';
import 'package:paper_safe_v2/core/image_paths.dart';
import 'package:paper_safe_v2/core/pallete.dart';
import 'package:paper_safe_v2/core/structs.dart';
import 'package:paper_safe_v2/features/Home/views/homepage.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _selectedDayController =
      TextEditingController(text: DateTime.now().day.toString());
  TextEditingController _selectedMonthController =
      TextEditingController(text: DateTime.now().month.toString());
  TextEditingController _selectedYearController =
      TextEditingController(text: DateTime.now().year.toString());
  gender _selectedGender = gender.male;
  userType _selectedUser = userType.student;
  DateTime? selectedDate = DateTime.now();

  Future<void> selectDate() async {
    DateTime? _selected = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  dialogBackgroundColor: ColorPallete.white,
                  colorScheme: ColorScheme.light(
                    primary:
                        ColorPallete.lightPrimary, // Header background color
                    onPrimary: Colors.white, // Header text color
                    onSurface: Colors.black, // Body text color
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          ColorPallete.lightPrimary, // Button text color
                    ),
                  )),
              child: child!);
        });
    if (_selected != null) {
      setState(() {
        selectedDate = _selected;
        _selectedDayController.text = _selected.day.toString();
        _selectedMonthController.text = _selected.month.toString();
        _selectedYearController.text = _selected.year.toString();
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    _selectedDayController.dispose();
    _selectedMonthController.dispose();
    _selectedYearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorPallete.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: width,
        margin: EdgeInsets.symmetric(
            horizontal: kIsWeb ? width * 0.3 : width * 0.1),
        // color: ColorPallete.lightGreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!kIsWeb)
              Spacer(
                flex: 1,
              ),
            Flexible(
                flex: 1,
                child: Text(
                  "Tell us more about you",
                  style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w700, height: 1),
                )),
            SizedBox(
              height: height * 0.02,
            ),
            Flexible(
                flex: 1,
                child: CommonWidgets().getTextField(
                    "First Name",
                    "First Name",
                    kIsWeb ? width * 0.23 : width * 0.70,
                    _firstNameController)),
            SizedBox(
              height: height * 0.01,
            ),
            Flexible(
                flex: 1,
                child: CommonWidgets().getTextField("Last Name", "Last Name",
                    kIsWeb ? width * 0.23 : width * 0.70, _lastNameController)),
            SizedBox(
              height: height * 0.01,
            ),
            Flexible(
                flex: 1,
                child: CommonWidgets().getTextField(
                    "Mobile No.",
                    "Enter your 10 digit mobile no.",
                    kIsWeb ? width * 0.23 : width * 0.70,
                    _mobileNumberController)),
            SizedBox(
              height: height * 0.01,
            ),
            Flexible(
                flex: 1,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonWidgets().getTextField(
                        "DOB",
                        "Day",
                        kIsWeb ? width * 0.07 : width * 0.18,
                        _selectedDayController),
                    SizedBox(
                      width: kIsWeb ? width * 0.01 : width * 0.01,
                    ),
                    CommonWidgets().getTextField(
                        "",
                        "Month",
                        kIsWeb ? width * 0.07 : width * 0.18,
                        _selectedMonthController),
                    SizedBox(
                      width: kIsWeb ? width * 0.01 : width * 0.01,
                    ),
                    CommonWidgets().getTextField(
                        "",
                        "Year",
                        kIsWeb ? width * 0.07 : width * 0.22,
                        _selectedYearController),
                    SizedBox(
                      width: kIsWeb ? width * 0.01 : width * 0.01,
                    ),
                    SizedBox(
                      width: kIsWeb ? width * 0.05 : width * 0.1,
                      child: IconButton(
                          onPressed: () {
                            selectDate();
                          },
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
                      child: Text("Gender",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
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
                                kIsWeb ? width * 0.08 : width * 0.20,
                                kIsWeb ? width * 0.07 : width * 0.18,
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
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Center(
                      child: CommonWidgets().getButton(
                          title: "Next",
                          h: height * 0.06,
                          w: kIsWeb ? width * 0.15 : width * 0.4,
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return Homepage();
                            }));
                          }),
                    )
                  ],
                )),
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
