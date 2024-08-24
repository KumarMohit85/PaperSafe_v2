import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/image_paths.dart';
import 'package:paper_safe_v2/core/pallete.dart';
import 'package:paper_safe_v2/features/Auth/views/pages/otp_verification.dart';

class EnterEmail extends StatefulWidget {
  const EnterEmail({super.key});

  @override
  State<EnterEmail> createState() => _EnterEmailState();
}

class _EnterEmailState extends State<EnterEmail> {
  bool _isLoading = false;
  bool agree = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPallete.white,
      body: Container(
        height: height,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Flexible(
              flex: 3,
              child: Text(
                "LOGIN OR SIGNUP",
                style: TextStyle(
                    fontSize: 48, fontWeight: FontWeight.w700, height: 1),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Flexible(
              flex: 5,
              child: Container(

                  // color: Colors.purple[400],
                  child: Image.asset(
                kIsWeb
                    ? ImagePaths.fillInsideLogoWeb
                    : ImagePaths.fillInsideLogo,
                //color: Colors.purple,
              )),
            ),
            Spacer(
              flex: 2,
            ),
            Flexible(
              flex: 3,
              child: Form(
                key: _formKey,
                child: SizedBox(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: _emailController,
                    validator: _validateEmail,
                    style: TextStyle(fontSize: 15, letterSpacing: 1.2),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: Icon(Icons.mail),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(width: 0, color: Colors.grey[200]!)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(width: 0, color: Colors.grey[200]!)),
                        hintText: "Enter your e-mail address",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1)),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: kIsWeb ? 2 : 1,
            ),
            Flexible(
              flex: 3,
              child: SizedBox(
                width: width * 0.8,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    agree
                        ? Flexible(
                            flex: 2,
                            child: InkWell(
                                onTap: () => alterAgree(),
                                child: Icon(
                                  Icons.check_box,
                                  color: ColorPallete.lightLightPrimary,
                                )),
                          )
                        : Flexible(
                            flex: 2,
                            child: InkWell(
                                onTap: () => alterAgree(),
                                child: Icon(
                                  Icons.check_box_outline_blank,
                                  color: ColorPallete.primary,
                                )),
                          ),
                    Spacer(
                      flex: 1,
                    ),
                    Flexible(
                      flex: 8,
                      child: SizedBox(
                        width: width * 0.8,
                        height: height * 0.2,
                        child: Text(
                          "I Agree to Papersafe's Privacy and policy and Terms & conditions",
                          style: TextStyle(fontSize: 15, height: 1),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: () {
                  // _submit(_emailController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpVerification()),
                  );
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: ColorPallete.primary,
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    );
  }

  void alterAgree() {
    print("alter agree called");
    if (agree) {
      setState(() {
        agree = false;
      });
    } else {
      setState(() {
        agree = true;
      });
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
