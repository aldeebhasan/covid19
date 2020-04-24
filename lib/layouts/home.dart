import 'package:covid19/apis/api.dart';
import 'package:covid19/entities/country.dart';
import 'package:covid19/entities/summary.dart';
import 'package:covid19/lang/localization.dart';
import 'package:covid19/layouts/coloredCard.dart';
import 'package:covid19/layouts/coutryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {

  Function updateLanguage;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Home(this.updateLanguage);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<ColoredCard> cards = [];
  Country country = Country("", "", "", "", "","", "", "", "");
  String title="";

  void loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      country = Country("", "", "", "", "","", "", "", "");
      title = prefs.get("country");
    });



//    title = "${Localization.translate( "home_title", Localizations.localeOf(context).languageCode)} ${prefs.get("country")}";

    APIResponce responce = await API.getCountrySummury();

    if(responce.status){
      setState(() {
        country = responce.data as Country;
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
          title: Text(title,
            style: TextStyle(fontFamily: 'stc', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
                icon: Image.asset("assets/images/lang.png"),
              onPressed: widget.updateLanguage),
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
                              (country.cases == ""),
                              Localization.translate("total",
                                  Localizations.localeOf(context).languageCode),
                              country.cases,
                              Colors.grey[400],
                              "assets/images/logo.png"),
                          new ColoredCard(
                              (country.cases == ""),
                              Localization.translate("today",
                                  Localizations.localeOf(context).languageCode),
                              country.todayCases,
                              Colors.grey[400],
                              "assets/images/logo.png"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new ColoredCard(
                              (country.cases == ""),
                              Localization.translate("active",
                                  Localizations.localeOf(context).languageCode),
                              country.active,
                              Colors.blue[400],
                              "assets/images/logo.png"),
                          new ColoredCard(
                              (country.cases == ""),
                              Localization.translate("recover",
                                  Localizations.localeOf(context).languageCode),
                              country.recovered,
                              Colors.green[400],
                              "assets/images/logo.png"),

                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new ColoredCard(
                              (country.cases == ""),
                              Localization.translate("today_death",
                                  Localizations.localeOf(context).languageCode),
                              country.todayDeaths,
                              Colors.red[400],
                              "assets/images/logo.png"),
                          new ColoredCard(
                              (country.cases == ""),
                              Localization.translate("death",
                                  Localizations.localeOf(context).languageCode),
                              country.deaths,
                              Colors.red[400],
                              "assets/images/logo.png"),
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  child: FlatButton.icon(
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/global");
                                      },
                                      color: Colors.red[700],
                                      icon: Icon(
                                        Icons.flag,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        Localization.translate(
                                            "global_btn",
                                            Localizations.localeOf(context)
                                                .languageCode),
                                        style: TextStyle(
                                            color: Colors.white, fontFamily: 'stc'),
                                      )),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: FlatButton.icon(
                                      onPressed: () {
                                        Navigator.pushNamed(context, "/guid");
                                      },
                                      color: Colors.red[700],
                                      icon: Icon(
                                        Icons.library_books,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        Localization.translate(
                                            "guid_btn",
                                            Localizations.localeOf(context)
                                                .languageCode),
                                        style: TextStyle(
                                            color: Colors.white, fontFamily: 'stc'),
                                      )),
                                ),
                              )
                            ],
                          ),
//                        Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 1,
//                              child: Padding(
//                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//                                child: FlatButton.icon(
//                                    onPressed: () {
//                                      Navigator.pushNamed(context, "/emergency");
//                                    },
//                                    color: Colors.red[700],
//                                    icon: Icon(
//                                      Icons.local_hospital,
//                                      color: Colors.white,
//                                    ),
//                                    label: Text(
//                                      Localization.translate(
//                                          "emergency_btn",
//                                          Localizations.localeOf(context)
//                                              .languageCode),
//                                      style: TextStyle(
//                                          color: Colors.white, fontFamily: 'stc'),
//                                    )),
//                              ),
//                            )
//                          ],
//                        ),
                        ],

                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(6),
                    color: Colors.white70,
                    child: Column(
                      children: <Widget>[
                        Text(
                          Localization.translate(
                              "note",
                              Localizations.localeOf(context)
                                  .languageCode),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'stc',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
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
