import 'package:covid19/apis/api.dart';
import 'package:covid19/dialogs/dialog.dart';
import 'package:covid19/entities/country.dart';
import 'package:covid19/lang/localization.dart';
import 'package:covid19/layouts/coutryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Countries extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  bool start = true;
  Map data = {};
  List<Country> countries = [];
  List<Country> filtered_countries = [];
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  void loadData() async {
    APIResponce responce = await API.getSummury();
    if(responce.status) {
      setState(() {
        start = false;
        countries = responce.data as List<Country>;
        filtered_countries = countries;
      });
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
//    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
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
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          title: Text(
            Localization.translate(
                "country_btn", Localizations.localeOf(context).languageCode),
            style: TextStyle(fontFamily: 'stc', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(Localization.translate("update_snb",
                        Localizations.localeOf(context).languageCode)),
                    duration: Duration(seconds: 1),
                  ));
//                  Dialogs.showLoadingDialog(context, _keyLoader);
                  setState(() {
                    start = true;
                  });
                  loadData();
                },
                icon: Icon(
                  Icons.update,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Visibility(
              visible: start,
              child: Expanded(
                flex: 1,
                child: Center(
                  child: SpinKitRipple(
                    color: Colors.red[500],
                    size: 75.0,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !start,
              child: Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: Localization.translate("search_hint",
                                Localizations.localeOf(context).languageCode)),
                        onChanged: (text) {
                          setState(() {
                            text = text.toLowerCase();
                            filtered_countries = countries
                                .where(
                                    (f) => f.name.toLowerCase().contains(text))
                                .toList();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Scrollbar(

                        child: ListView.builder(

                            itemCount: filtered_countries.length,
                            itemBuilder: (context, index) {
                              return CountryCard(filtered_countries[index]);
                            }),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
