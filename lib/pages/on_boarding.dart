import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:turkey_news/widgets/tabs_page.dart';

class OnBoarding extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'SICAK GÜNDEM',
      subTitle: '',
      imageUrl: 'assets/undraw/news.png',
    ),
    Introduction(
      title: 'KOVİD-19',
      subTitle: '',
      imageUrl: 'assets/undraw/covid.png',
    ),
    Introduction(
      title: 'HAVA DURUMU',
      subTitle: '',
      imageUrl: 'assets/undraw/weather.png',
    ),
    Introduction(
      title: 'NAMAZ VAKİTLERİ',
      subTitle: '',
      imageUrl: 'assets/undraw/clock.png',
    ),
    Introduction(
      title: 'DÖVİZ',
      subTitle: '',
      imageUrl: 'assets/undraw/doviz.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TabsPage(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}
