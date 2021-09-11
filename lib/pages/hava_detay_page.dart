import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turkey_news/components/main_app_bar.dart';
import 'package:turkey_news/constants/constants.dart';
import 'package:turkey_news/model/weather_model.dart';

class HavaDetay extends StatefulWidget {
  Results res;
  String sehir;

  HavaDetay({required this.res,required this.sehir});

  @override
  _HavaDetayState createState() => _HavaDetayState();
}

class _HavaDetayState extends State<HavaDetay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: mainAppBar(third, widget.sehir.toUpperCase()),
      backgroundColor: Color(0xFF8AD6F1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: size.width * 4 / 5,
              height: size.height * 2 / 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.res.date,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF8AD6F1),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    widget.res.day.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8AD6F1),
                      fontSize: 27,
                    ),
                  ),
                  Container(
                    width: size.width / 3,
                    height: size.width / 3,
                    child: SvgPicture.network(
                      widget.res.icon,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "Durum: ${widget.res.description}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF8AD6F1), fontSize: 22),
                  ),
                  Text(
                    "Nem Oranı:${widget.res.humidity}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF8AD6F1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Gündüz Sıcaklık:${widget.res.degree}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF8AD6F1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Gece Sıcaklık:${widget.res.night}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF8AD6F1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
