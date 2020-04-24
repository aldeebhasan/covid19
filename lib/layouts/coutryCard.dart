import 'package:covid19/entities/country.dart';
import 'package:covid19/lang/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CountryCard extends StatefulWidget {
  Country country;

  CountryCard(this.country);

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {


  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: ListTile(

              contentPadding: EdgeInsets.all(8),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(widget.country.name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'stc'),),
                  Text(Localization.translate("recovered_case",
                      Localizations.localeOf(context).languageCode) +" : "+
                      widget.country.recovered,style: TextStyle(fontFamily: 'stc',color: Colors.green[700])),
                ],
              ),
              subtitle:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(Localization.translate("confirmed_case",
                          Localizations.localeOf(context).languageCode) +" : "+
                          widget.country.cases,style: TextStyle(fontFamily: 'stc'),),
                      Text(Localization.translate("new_confirmed_case",
                          Localizations.localeOf(context).languageCode) +" : "
                          +widget.country.todayCases,style: TextStyle(fontFamily: 'stc')),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(Localization.translate("death_case",
                          Localizations.localeOf(context).languageCode) +" : "+
                          widget.country.deaths,style: TextStyle(fontFamily: 'stc',color: Colors.red[700])),
                      Text(Localization.translate("new_death_case",
                          Localizations.localeOf(context).languageCode) +" : "+
                          widget.country.todayDeaths,style: TextStyle(fontFamily: 'stc',color: Colors.red[700])),
                    ],
                  ),
                ],
              ),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red[700],
                child: Text(widget.country.active,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
