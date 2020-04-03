import 'package:covid19/apis/api.dart';
import 'package:covid19/entities/country.dart';
import 'package:covid19/entities/summary.dart';
import 'package:covid19/layouts/coloredCard.dart';
import 'package:covid19/layouts/coutryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  List<Country> countries = [];
  List<ColoredCard> cards = [
    new ColoredCard(true, "Country Effected", "?", Colors.grey[400],
        "assets/images/logo.png"),
    new ColoredCard(
        true, "Total", "?", Colors.amber[400], "assets/images/logo.png"),
    new ColoredCard(
        true, "Active", "?", Colors.blue[400], "assets/images/logo.png"),
    new ColoredCard(
        true, "Recovered", "?", Colors.green[400], "assets/images/logo.png"),
    new ColoredCard(
        true, "Death", "?", Colors.red[400], "assets/images/logo.png"),
  ];

  void loadData() async {
    Summary summary = await API.getGeneralSummury();
    setState(() {
      cards = [
        new ColoredCard(false, "Country Effected", summary.affectedCountries,
            Colors.grey[400], "assets/images/logo.png"),
        new ColoredCard(false, "Total", summary.cases, Colors.amber[400],
            "assets/images/logo.png"),
        new ColoredCard(false, "Active", summary.active, Colors.blue[400],
            "assets/images/logo.png"),
        new ColoredCard(false, "Recovered", summary.recovered,
            Colors.green[400], "assets/images/logo.png"),
        new ColoredCard(false, "Death", summary.deaths, Colors.red[400],
            "assets/images/logo.png"),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    countries = data['countries'];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          title: Text(
            "CORONAVIRUS PANDEMIC",
            style: TextStyle(fontFamily: 'stc', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            Builder(
              builder: (context) => FlatButton.icon(
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Updating data..."),
                    duration: Duration(seconds: 1),
                  ));
                  loadData();
                },
                label: Text(""),
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
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        cards[0],
                      ],
                    ),
                    Row(
                      children: <Widget>[cards[1], cards[2]],
                    ),
                    Row(
                      children: <Widget>[cards[3], cards[4]],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton.icon(onPressed: (){
                              Navigator.pushNamed(context, "/coutries", arguments: {
                                'countries': countries,
                              });
                            },color: Colors.red[700],
                                icon: Icon(Icons.flag,color: Colors.white,),
                                label: Text("Show Countries",style: TextStyle(color: Colors.white),)),
                          ),
                        )
                      ],
                    ),
                  ],
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
                        Text("Developed by :Hasan Deeb",textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'stc',fontWeight: FontWeight.bold,fontSize: 16),),
                        Text("aldeeb.91@gmail.com",textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'stc',fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red),)
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
