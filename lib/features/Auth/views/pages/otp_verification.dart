import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/image_paths.dart';
import 'package:paper_safe_v2/core/pallete.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String? otp;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorPallete.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        height: height,
        width: width,
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: SvgPicture.asset(
                kIsWeb ? ImagePaths.loginSvgWeb : ImagePaths.loginSvg,
              ),
            ),
            Flexible(
              flex: 2,
              child: Pinput(
                length: 6,
                keyboardType: TextInputType.number,
                defaultPinTheme: PinTheme(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200]),
                    width: width * 0.14,
                    height: height * 0.065,
                    textStyle: TextStyle(fontSize: 30)),
                onCompleted: (value) {
                  setState(() {
                    otp = value;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    otp = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
