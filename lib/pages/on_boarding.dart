import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:turkey_news/widgets/tabs_page.dart';

class OnBoarding extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'SICAK GÜNDEM',
      subTitle: 'Ülkemizde yaşanan gelişmeler anında cebinize gelsin.',
      imageUrl: 'assets/undraw/news.png',
    ),
    Introduction(
      title: 'KOVİD-19',
      subTitle: 'Günlük vaka sayılarını site site gezmeyi bırakın.',
      imageUrl: 'assets/undraw/covid.png',
    ),
    Introduction(
      title: 'HAVA DURUMU',
      subTitle: 'Her şehrin 1 haftalık hava durumu bilgisi artık cebinizde.',
      imageUrl: 'assets/undraw/weather.png',
    ),
    Introduction(
      title: 'NAMAZ VAKİTLERİ',
      subTitle: 'Günlük namaz vakitleri artık cebinizde',
      imageUrl: 'assets/undraw/clock.png',
    ),
    Introduction(
      title: 'DÖVİZ',
      subTitle: 'Borsa sevenleri de unutmadık.',
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
