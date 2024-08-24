import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paper_safe_v2/core/image_paths.dart';
import 'package:paper_safe_v2/core/pallete.dart';
import 'package:paper_safe_v2/features/YourDocuments/widgets/aadhar_frame.dart';
import 'package:paper_safe_v2/features/YourDocuments/widgets/ad_frame.dart';
import 'package:paper_safe_v2/features/YourDocuments/widgets/bar_button.dart';
import 'package:paper_safe_v2/features/YourDocuments/widgets/end_drawer.dart';
import 'package:paper_safe_v2/features/YourDocuments/widgets/pan_frame.dart';
import 'package:paper_safe_v2/features/YourDocuments/widgets/square_button.dart';
import 'package:paper_safe_v2/features/YourDocuments/widgets/start_drawer.dart';

class YourDocumentsPage extends StatefulWidget {
  const YourDocumentsPage({super.key});

  @override
  State<YourDocumentsPage> createState() => _YourDocumentsPageState();
}

class _YourDocumentsPageState extends State<YourDocumentsPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kIsWeb ? 200 : 0,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorPallete.white,
        drawer: StartDrawer(),
        endDrawer: EndDrawer(),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 0.08 * width),
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 1),
              Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          icon: Icon(
                            Icons.account_circle,
                            size: 45,
                          )),
                      IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          icon: Icon(
                            Icons.share,
                            size: 45,
                          ))
                    ],
                  )),
              Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 5),
                    child: Text(
                      "Your Documents",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  )),
              Flexible(
                  flex: 6,
                  child: CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 1.5, viewportFraction: 0.93),
                      items: [AadharFrame(), PanFrame()])),
              Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: CarouselSlider(
                        options: CarouselOptions(
                            aspectRatio: 2.4, viewportFraction: 0.93),
                        items: [AdFrame(), AdFrame()]),
                  )),
              Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SquareButton(),
                        SquareButton(),
                      ],
                    ),
                  )),
              Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: BarButton(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
