import 'package:covid19/apis/api.dart';
import 'package:covid19/entities/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void loadData() async {
     List<Country> countries = await API.getSummury();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'countries': countries,
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    fontSize: 18, fontFamily: 'stc', color: Colors.white),
              ),
              SpinKitRipple(
                color: Colors.white,
                size: 75.0,
              )
            ],
          ),
        ));
  }
}
