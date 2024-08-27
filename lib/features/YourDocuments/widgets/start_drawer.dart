import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/common_widgets.dart';
import 'package:paper_safe_v2/core/pallete.dart';
import 'package:paper_safe_v2/core/structs.dart';

class StartDrawer extends StatefulWidget {
  const StartDrawer({super.key});

  @override
  State<StartDrawer> createState() => _StartDrawerState();
}

class _StartDrawerState extends State<StartDrawer> {
  TextEditingController _nameController =
      TextEditingController(text: "Mohit Kumar Pal");
  TextEditingController _mobileNumber =
      TextEditingController(text: "8581017107");
  TextEditingController _emailController =
      TextEditingController(text: "mk8581017107@gmail.com");
  TextEditingController _selectedDayController =
      TextEditingController(text: DateTime.now().day.toString());
  TextEditingController _selectedMonthController =
      TextEditingController(text: DateTime.now().month.toString());
  TextEditingController _selectedYearController =
      TextEditingController(text: DateTime.now().year.toString());

  DateTime? selectedDate = DateTime.now();
  gender _selectedGender = gender.male;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("height: ${height}");
    print("width: ${width}");
    return Drawer(
        backgroundColor: ColorPallete.white,
        width: kIsWeb ? width * 0.1 : width * 0.7,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              // color: ColorPallete.lightGreen,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: height * 0.05,
                  )),
              Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            CupertinoIcons.back,
                            size: 40,
                          )),
                      Text(
                        "Your Profile",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      )
                    ],
                  )),

              Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        flex: 2,
                        child: Icon(
                          Icons.account_circle,
                          size: 60,
                          color: ColorPallete.lightPrimary,
                        ),
                      ),
                      Spacer(
                        flex: 5,
                      ),
                      Flexible(
                        flex: 3,
                        child: Row(
                          children: [
                            Text("Edit"),
                            IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                          ],
                        ),
                      ),
                    ],
                  )),
              Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: height * 0.01,
                  )),
              // Spacer(
              //   flex: 1,
              // ),
              Flexible(
                  flex: 2,
                  child: CommonWidgets().getTextField(
                      "Your Name", "", width * 0.55, _nameController)),
              Flexible(
                  flex: 2,
                  child: CommonWidgets().getTextField(
                      "Mobile No.", "", width * 0.55, _mobileNumber)),
              Flexible(
                  flex: 2,
                  child: CommonWidgets().getTextField(
                      "Email ID", "", width * 0.55, _emailController)),
              Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        flex: 4,
                        child: CommonWidgets().getTextField(
                            "DOB", "Day", width * 0.16, _selectedDayController),
                      ),
                      Flexible(
                        flex: 4,
                        child: CommonWidgets().getTextField("", "Month",
                            width * 0.18, _selectedMonthController),
                      ),
                      Flexible(
                        flex: 4,
                        child: CommonWidgets().getTextField(
                            "", "Year", width * 0.23, _selectedYearController),
                      ),
                      Flexible(
                          flex: 2,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(CupertinoIcons.calendar)))
                    ],
                  )),
              Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        flex: 17,
                        child: Row(
                          children: gender.values.map((gender g) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedGender = g;
                                  });
                                },
                                child: g != gender.male
                                    ? CommonWidgets().getSelectedContainer(
                                        Text(g.toString().split('.').last),
                                        _selectedGender == g,
                                        kIsWeb ? width * 0.08 : width * 0.18,
                                        kIsWeb ? width * 0.07 : width * 0.18,
                                        height * 0.06,
                                        height * 0.065,
                                        30,
                                      )
                                    : CommonWidgets().getSelectedContainer(
                                        Text(g.toString().split('.').last),
                                        _selectedGender == g,
                                        kIsWeb ? width * 0.08 : width * 0.18,
                                        kIsWeb ? width * 0.07 : width * 0.18,
                                        height * 0.06,
                                        height * 0.065,
                                        30,
                                        title: "Gender"),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  )),
              Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Spacer(
                        flex: 4,
                      ),
                      Flexible(
                          flex: 2,
                          child: TextButton(
                              onPressed: () {}, child: Text("Update")))
                    ],
                  )),
              Flexible(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ))),
              Flexible(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Delete Account",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorPallete.red),
                      )))
            ],
          ),
        ));
  }
}
