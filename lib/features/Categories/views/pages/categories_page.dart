import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/common_widgets.dart';
import 'package:paper_safe_v2/core/pallete.dart';
import 'package:paper_safe_v2/features/Categories/models/categories_items.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool isListView = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: ColorPallete.white,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 0.08 * width),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Spacer(
                flex: 4,
              ),
              Flexible(
                  flex: 3,
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
                  )),
              Spacer(
                flex: 1,
              ),
              Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 2,
                          child: CommonWidgets().getIconButton(
                              isActive: false,
                              icon: Icons.search,
                              onPressed: () {})),
                      Spacer(
                        flex: 7,
                      ),
                      Flexible(
                          flex: 2,
                          child: CommonWidgets().getIconButton(
                              isActive: !isListView,
                              icon: Icons.apps,
                              onPressed: () {
                                setState(() {
                                  isListView = !isListView;
                                });
                              })),
                      Flexible(
                          flex: 2,
                          child: CommonWidgets().getIconButton(
                              isActive: isListView,
                              icon: Icons.splitscreen,
                              onPressed: () {
                                setState(() {
                                  isListView = !isListView;
                                });
                              })),
                    ],
                  )),
              Spacer(
                flex: 1,
              ),
              if (isListView)
                for (int i = 0; i < getListView(height).length; i++)
                  getListView(height)[i]
              else
                for (int i = 0; i < getThumbnailView().length; i++)
                  getThumbnailView()[i]
              // isListView? getListView(): getThumbnailView()
            ])));
  }

  List<Widget> getThumbnailView() {
    List<Widget> list = []; // Initialize an empty list

    for (int i = 0; i < listCategoriesItems.length; i += 2) {
      list.add(
        Flexible(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonWidgets().getSquareButton(
                    title: listCategoriesItems[i].title,
                    svgPath: listCategoriesItems[i].svgPath),
                if (i + 1 < listCategoriesItems.length)
                  CommonWidgets().getSquareButton(
                      title: listCategoriesItems[i + 1].title,
                      svgPath: listCategoriesItems[i + 1].svgPath),
              ],
            ),
          ),
        ),
      );
    }

    return list; // Return the list of widgets
  }

  List<Widget> getListView(double height) {
    List<Widget> list = [];
    for (int i = 0; i < listCategoriesItems.length; i++)
      list.add(Flexible(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CommonWidgets().getBarButton(
                height: height * 0.065,
                title: listCategoriesItems[i].title,
                svgPath: listCategoriesItems[i].svgPath),
          )));

    return list;
  }
}
