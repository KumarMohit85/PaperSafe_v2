import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/pallete.dart';

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
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorPallete.white,
      drawer: Drawer(
        backgroundColor: ColorPallete.white,
        width: kIsWeb ? width * 0.4 : width * 0.7,
      ),
      endDrawer: Drawer(
        backgroundColor: ColorPallete.white,
        width: kIsWeb ? width * 0.4 : width * 0.7,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 0.08 * width),
        color: Colors.amber,
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
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Your Documents",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
