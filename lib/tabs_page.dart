import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
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
  int _selectedIndex = 3;
  Color first = Color(0xFFD11717);
  Color second = Color(0xFF006D61);
  Color third = Color(0xFF2290B7);
  Color fourth = Color(0xFF881B1B);

  static List<Widget> _widgetOptions = <Widget>[
    Center(child: HomePage()),
    Center(child: CovidVeri()),
    Center(child: HavaDurumu()),
    Center(child: NamazVakitleri()),
    //Center(child: DovizPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: _selectedIndex == 0
              ? first
              : _selectedIndex == 1
                  ? second
                  : _selectedIndex == 2
                      ? third
                      : _selectedIndex == 3
                          ? fourth
                          : Colors.orange,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: _selectedIndex == 0
              ? first
              : _selectedIndex == 1
                  ? second
                  : _selectedIndex == 2
                      ? third
                      : _selectedIndex == 3
                          ? fourth
                          : Colors.orange,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.white,
          unselectedItemIconColor: Colors.white,
          unselectedItemLabelColor: Colors.white,
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
            selectedBackgroundColor: _selectedIndex == 0
                ? first
                : _selectedIndex == 1
                    ? second
                    : _selectedIndex == 2
                        ? third
                        : _selectedIndex == 3
                            ? fourth
                            : Colors.orange,
          ),
          FFNavigationBarItem(
            iconData: Typicons.cloud_sun,
            label: 'METEOROLOJİ',
            selectedBackgroundColor: _selectedIndex == 0
                ? first
                : _selectedIndex == 1
                    ? second
                    : _selectedIndex == 2
                        ? third
                        : _selectedIndex == 3
                            ? fourth
                            : Colors.orange,
          ),
          FFNavigationBarItem(
            iconData: Typicons.clock,
            label: 'NAMAZ',
            selectedBackgroundColor: _selectedIndex == 0
                ? first
                : _selectedIndex == 1
                    ? second
                    : _selectedIndex == 2
                        ? third
                        : _selectedIndex == 3
                            ? fourth
                            : Colors.orange,
          ),
          /*
          FFNavigationBarItem(
            iconData: Icons.monetization_on_outlined,
            label: '',
            selectedBackgroundColor: _selectedIndex == 0
                ? first
                : _selectedIndex == 1
                ? second
                : _selectedIndex == 2
                ? third
                : _selectedIndex == 3
                ? fourth
                : Colors.orange,
          ),
           */
        ],
      ),
    );
  }
}
