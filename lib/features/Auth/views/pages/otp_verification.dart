import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/common_widgets.dart';
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
            Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 4,
              child: SvgPicture.asset(
                kIsWeb ? ImagePaths.loginSvgWeb : ImagePaths.loginSvg,
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter OTP",
                    style: TextStyle(fontSize: 18),
                  ),
                  Pinput(
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
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: CommonWidgets().getButton(
                    title: "Verify OTP",
                    h: height * 0.06,
                    w: width * 0.5,
                    onTap: () {})),
            SizedBox(
              height: height * 0.02,
            ),
            Flexible(flex: 1, child: Text("Didn't Receive OTP?")),
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: kIsWeb ? width * 0.38 : width * 0.1,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "CHANGE NUMBER",
                        style: TextStyle(
                            color: ColorPallete.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text("or"),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "RESEND OTP",
                        style: TextStyle(
                            color: ColorPallete.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: kIsWeb ? width * 0.3 : width * 0.1,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
