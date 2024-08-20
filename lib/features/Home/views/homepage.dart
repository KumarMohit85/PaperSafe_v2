import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paper_safe_v2/core/pallete.dart';
import 'package:paper_safe_v2/features/YourDocuments/views/your_documents_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 250.0 : 0),
      child: Scaffold(
        backgroundColor: ColorPallete.white,
        body: YourDocumentsPage(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: ColorPallete.grey,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
          ],
          iconSize: 38,
        ),
      ),
    );
  }
}
