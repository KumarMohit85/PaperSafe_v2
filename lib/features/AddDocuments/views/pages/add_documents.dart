import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/common_widgets.dart';
import 'package:paper_safe_v2/core/image_paths.dart';
import 'package:paper_safe_v2/core/pallete.dart';

class AddDocuments extends StatefulWidget {
  const AddDocuments({super.key});

  @override
  State<AddDocuments> createState() => _AddDocumentsState();
}

class _AddDocumentsState extends State<AddDocuments> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorPallete.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 0.08 * width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(
              flex: 3,
            ),
            Flexible(
                flex: 3,
                child: Text(
                  "Add Documents",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                )),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 1,
                child: Text(
                  "Most Added",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                )),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 3,
                child: CommonWidgets().getBarButton(
                    height: height * 0.065,
                    title: "Aadhar Card",
                    svgPath: ImagePaths.aadharLogo)),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 3,
                child: CommonWidgets().getBarButton(
                    height: height * 0.065,
                    title: "PAN Card",
                    svgPath: ImagePaths.creditCardLogo)),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 3,
                child: CommonWidgets().getBarButton(
                    height: height * 0.065,
                    title: "Marksheet",
                    svgPath: ImagePaths.marksheet)),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 3,
                child: CommonWidgets().getBarButton(
                    height: height * 0.065,
                    title: "Tickets",
                    svgPath: ImagePaths.ticketsLogo)),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 3,
                child: CommonWidgets().getBarButton(
                    height: height * 0.065,
                    title: "College ID",
                    svgPath: ImagePaths.idCardLogo)),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 1,
                child: Divider(
                  thickness: 3,
                  color: ColorPallete.primary,
                )),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CommonWidgets().getSquareButton(
                        svgPath: ImagePaths.qrCodeLogo, title: "Scan QR"),
                    CommonWidgets().getSquareButton(
                        title: "Upload Photo", svgPath: ImagePaths.backupLogo)
                  ],
                )),
            Spacer(
              flex: 1,
            ),
            Flexible(
                flex: 3,
                child: CommonWidgets().getBarButton(
                    height: height * 0.065,
                    title: "Form Fill Up",
                    svgPath: ImagePaths.articleLogo)),
          ],
        ),
      ),
    );
  }
}
