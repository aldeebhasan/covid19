import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid19/apis/api.dart';
import 'package:covid19/entities/country.dart';
import 'package:covid19/lang/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          title: Text(
            Localization.translate(
                "emergency_btn", Localizations.localeOf(context).languageCode),
            style: TextStyle(fontFamily: 'stc', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,

        ),
        body: SafeArea(

          child: Container(

            child: Text("waiting for details",textAlign: TextAlign.center,),
          )
        ));
  }
}
