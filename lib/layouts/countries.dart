import 'package:covid19/apis/api.dart';
import 'package:covid19/entities/country.dart';
import 'package:covid19/layouts/coutryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  bool start = true;
  Map data = {};
  List<Country> countries = [];
  List<Country> filtered_countries = [];

  void loadData() async {
    List<Country> new_countries = await API.getSummury();
    setState(() {
      countries = new_countries;
      filtered_countries = countries;
    });
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    countries = data['countries'];
    if(start){
      filtered_countries = countries;
      start = false;
    }
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
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Updating data..."),
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
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Enter a search term'),
                onChanged: (text){
                  setState(() {
                    text = text.toLowerCase();
                    filtered_countries = countries.where((f) => f.name.toLowerCase().contains(text)).toList();
                  });
                },

              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: filtered_countries.length,
                  itemBuilder: (context, index) {
                    return CountryCard(filtered_countries[index]);
                  }),
            )
          ],
        ));
  }
}
