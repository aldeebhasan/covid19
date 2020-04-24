import 'package:covid19/apis/api.dart';
import 'package:covid19/entities/country.dart';
import 'package:covid19/lang/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void loadData() async {
     APIResponce responce = await API.getSummury();
     if (responce.status) {

       final prefs = await SharedPreferences.getInstance();
       if(prefs.containsKey("country") ) {
         Navigator.pushReplacementNamed(context, "/home");
       }else {
         Navigator.pushReplacementNamed(context, "/select", arguments: {
           'countries': responce.data,
         });
       }
     }else{
       widget._scaffoldKey.currentState.showSnackBar(
           SnackBar(
             content: Text(Localization.translate("error", Localizations.localeOf(context)
                 .languageCode),style: TextStyle(fontFamily: 'stc'),),
             duration: Duration(days: 365),
             action: SnackBarAction(
               label: Localization.translate("retry", Localizations.localeOf(context).languageCode),
               onPressed: () {
                 loadData();
               },
             ),
           ));

     }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget._scaffoldKey,
        backgroundColor: Colors.red[700],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  radius: 125,
                ),
              ),
              Text(
                "COVID-19",
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'stc',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "WHATS HAPPENED NOW",
                style: TextStyle(
                    fontSize: 18, fontFamily: 'stc', color: Colors.white,fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SpinKitRipple(
                  color: Colors.white,
                  size: 75.0,
                ),
              ),
              Text(
                "ALL COPY RIGHT RESERVED FOR AL_DEEB",
                style: TextStyle(
                    fontSize: 12, fontFamily: 'stc', color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
