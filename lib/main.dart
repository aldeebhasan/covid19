import 'package:covid19/layouts/countries.dart';
import 'package:covid19/layouts/emergency.dart';
import 'package:covid19/layouts/guid.dart';
import 'package:covid19/layouts/home_gloabl.dart';
import 'package:covid19/layouts/home.dart';
import 'package:covid19/layouts/loading.dart';
import 'package:covid19/layouts/select_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());




class MyApp extends StatefulWidget {

   Locale current = Locale('ar', 'AE');

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void updateLag(){
    Locale updated;
    if(widget.current.languageCode == "ar"){
      updated =  Locale('en', 'US');
    }else{
      updated  =  Locale('ar', 'AE');
    }
    setState(() {
      widget.current = updated;
    });
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'),
        Locale('en', 'US'),

      ],
      locale: widget.current,
      title: 'COVID 19',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(updateLag),
        '/global': (context) => Home_Global(),
        '/coutries': (context) => Countries(),
        '/emergency': (context) => Emergency(),
        '/guid': (context) => Guid(),
        '/select': (context) => SelectCountry(updateLag)
      },

    );
  }



}
