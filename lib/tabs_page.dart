import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';

import 'package:fluttericon/typicons_icons.dart';

import 'package:turkey_news/covid.dart';
import 'package:turkey_news/pages/home_page.dart';

import 'hava_durumu.dart';
import 'namaz_vakitleri.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

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
            iconData: Typicons.news,
            label: 'GÜNDEM',
          ),
          FFNavigationBarItem(
            iconData: Icons.masks_outlined,
            label: 'COVİD-19',
            selectedBackgroundColor: Colors.black,
          ),
          FFNavigationBarItem(
            iconData: Typicons.cloud_sun,
            label: 'METEOROLOJİ',
            selectedBackgroundColor: Colors.black,
          ),
          FFNavigationBarItem(
            iconData: Typicons.clock,
            label: 'NAMAZ ',
            selectedBackgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
