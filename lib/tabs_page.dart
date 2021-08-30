import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:turkey_news/covid.dart';
import 'package:turkey_news/pages/home_page.dart';

import 'hava_durumu.dart';
import 'namaz_vakitleri.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 3;

  static List<Widget> _widgetOptions = <Widget>[
    Center(child: HomePage()),
    Center(child: CovidVeri()),
    Center(child: HavaDurumu()),
    Center(child: NamazVakitleri()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.black,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.black,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          unselectedItemIconColor: Colors.white,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: _selectedIndex,
        onSelectTab: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.computer,
            label: 'GÜNDEM',
          ),
          FFNavigationBarItem(
            iconData: Icons.masks,
            label: 'COVİD-19',
            selectedBackgroundColor: Colors.black,
          ),

          FFNavigationBarItem(
            iconData: Icons.storm,
            label: 'METEOROLOJİ',
            selectedBackgroundColor: Colors.black,
          ),
          FFNavigationBarItem(
            iconData: Icons.mark_chat_unread_rounded,
            label: 'NAMAZ ',
            selectedBackgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
