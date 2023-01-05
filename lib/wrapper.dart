import 'package:flutter/material.dart';

import 'pages/breaking_news.dart';
import 'pages/saved_news.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  int _currentBottomNavIndex = 0;
  final List<Widget> tabsList = [
    BreakingNews(),
    SavedNews(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabsList[_currentBottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBottomNavIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepOrange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Breaking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: "Saved",
          )
        ],
        onTap: (index) {
          setState(() {
            _currentBottomNavIndex = index;
          });
        },
      ),
    );
  }
}
