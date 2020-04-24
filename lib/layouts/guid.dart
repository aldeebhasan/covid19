import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid19/apis/api.dart';
import 'package:covid19/entities/country.dart';
import 'package:covid19/lang/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Guid extends StatefulWidget {
  @override
  _GuidState createState() => _GuidState();
}

class _GuidState extends State<Guid> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[700],
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          title: Text(
            Localization.translate(
                "guid_btn", Localizations.localeOf(context).languageCode),
            style: TextStyle(fontFamily: 'stc', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,

        ),
        body: SafeArea(

          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.fill)),
            child: CarouselSlider.builder(
              height: MediaQuery.of(context).size.height,
              itemCount: 10,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              aspectRatio: 16/9,
              enableInfiniteScroll: false,
              itemBuilder: (BuildContext context, int itemIndex) =>
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/$itemIndex.jpg"), fit: BoxFit.fitWidth)),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
//                      child: Image.asset("assets/images/$itemIndex.jpg")
                  ),
            ),
          )
        ));
  }
}
