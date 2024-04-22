import 'package:dubaothoitiet/page/detail/detail_page.dart';
import 'package:dubaothoitiet/page/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationCustom extends StatefulWidget {
  const BottomNavigationCustom({super.key});

  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  List<BottomNavigationBarItem> lisItem = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.list_bullet), label: 'List'),
  ];

  List<Widget> listPage = [
    const HomePage(),
    const DetailPage(),
  ];

  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: listPage[activePage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activePage,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: Colors.white12,
        elevation: 0,
        onTap: (index) {
          setState(() {
            activePage = index;
          });
        },
        items: lisItem,
      ),
    );
  }
}
