import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/pallete.dart';
import 'package:paper_safe_v2/features/Auth/views/pages/enter_email.dart';
import 'package:paper_safe_v2/features/Onboarding/views/page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<Pages> _list = [
    Pages(
        svgPath: "assets/images/onboarding_find_docs.svg",
        title: "Keep everything at one place",
        subtitle: "PaperSafe helps you in organizing your digital life"),
    Pages(
        svgPath: "assets/images/onboarding_secure_doc.svg",
        title: "Keep everything Secure",
        subtitle: "With PaperSafe's backup and secure app lock"),
    Pages(
        svgPath: "assets/images/onboarding_share_image.svg",
        title: "Easily share your documents",
        subtitle: "No need to search in gallery or taking photos all the time"),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorPallete.white,
      body: Column(
        children: [
          _list[_currentIndex],
          _currentIndex == 2
              ? _getStarted(height, width)
              : _getDot(_currentIndex),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                  CupertinoIcons.forward,
                  size: 65,
                  color: ColorPallete.primary,
                ),
                onPressed: () {
                  setState(() {
                    _currentIndex = (_currentIndex + 1) % 3;
                  });
                },
              ),
            ),
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }

  Widget _getDot(int index) {
    return Row(
      children: [
        Spacer(),
        index == 0 ? _activeDot() : _inactiveDot(0),
        index == 1 ? _activeDot() : _inactiveDot(1),
        index == 2 ? _activeDot() : _inactiveDot(2),
        Spacer()
      ],
    );
  }

  Widget _inactiveDot(int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Container(
          height: 13,
          width: 13,
          decoration: BoxDecoration(
              color: ColorPallete.lightPrimary,
              borderRadius: BorderRadius.circular(6.5)),
        ),
      ),
    );
  }

  Widget _activeDot() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
            color: ColorPallete.primary,
            borderRadius: BorderRadius.circular(9)),
      ),
    );
  }

  Widget _getStarted(double h, double w) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return EnterEmail();
        }));
      },
      child: Container(
        height: h * 0.06,
        width: w * 0.5,
        decoration: BoxDecoration(
            color: ColorPallete.primary,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          "Get Started",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
