import 'package:covid19/apis/api.dart';
import 'package:covid19/entities/country.dart';
import 'package:covid19/entities/summary.dart';
import 'package:covid19/lang/localization.dart';
import 'package:covid19/layouts/coloredCard.dart';
import 'package:covid19/layouts/coutryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Global extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  _Home_GlobalState createState() => _Home_GlobalState();
}

class _Home_GlobalState extends State<Home_Global> {
  List<ColoredCard> cards = [];
  Summary summary = Summary("", "", "", "", "");

  void loadData() async {
    setState(() {
      summary = Summary("", "", "", "", "");
    });
    APIResponce responce = await API.getGeneralSummury();
    if(responce.status) {
      setState(() {
        summary = responce.data as Summary;
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
                "home_global_title", Localizations.localeOf(context).languageCode),
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
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.fill)),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new ColoredCard(
                              (summary.affectedCountries == ""),
                              Localization.translate("country_effected",
                                  Localizations.localeOf(context).languageCode),
                              summary.affectedCountries,
                              Colors.grey[400],
                              "assets/images/logo.png"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new ColoredCard(
                              (summary.cases == ""),
                              Localization.translate("total",
                                  Localizations.localeOf(context).languageCode),
                              summary.cases,
                              Colors.amber[400],
                              "assets/images/logo.png"),
                          new ColoredCard(
                              (summary.active == ""),
                              Localization.translate("active",
                                  Localizations.localeOf(context).languageCode),
                              summary.active,
                              Colors.blue[400],
                              "assets/images/logo.png"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new ColoredCard(
                              (summary.recovered == ""),
                              Localization.translate("recover",
                                  Localizations.localeOf(context).languageCode),
                              summary.recovered,
                              Colors.green[400],
                              "assets/images/logo.png"),
                          new ColoredCard(
                              (summary.deaths == ""),
                              Localization.translate("death",
                                  Localizations.localeOf(context).languageCode),
                              summary.deaths,
                              Colors.red[400],
                              "assets/images/logo.png"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/coutries");
                                  },
                                  color: Colors.red[700],
                                  icon: Icon(
                                    Icons.flag,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    Localization.translate(
                                        "country_btn",
                                        Localizations.localeOf(context)
                                            .languageCode),
                                    style: TextStyle(
                                        color: Colors.white, fontFamily: 'stc'),
                                  )),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image(image:AssetImage("assets/images/stay_home.jpg"),fit: BoxFit.cover,height: 250,),
                  Container(
                    padding: EdgeInsets.all(6),
                    color: Colors.white70,
                    child: Column(
                      children: <Widget>[

                        Text(
                          "Developed by: AL_DEEB",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'stc',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.red),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
