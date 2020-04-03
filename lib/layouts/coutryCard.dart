import 'package:covid19/entities/country.dart';
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
              title: Text(widget.country.name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'stc'),),
//        subtitle:  Text(widget.country.totalConfirmed,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'stc'),),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red[700],
                child: Text(widget.country.totalConfirmed,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Confirmed Case: "+widget.country.totalConfirmed,style: TextStyle(fontFamily: 'stc'),),
                Text("New Confirmed: "+widget.country.newConfirmed,style: TextStyle(fontFamily: 'stc')),
                Text("Death Case: "+widget.country.totalDeaths,style: TextStyle(fontFamily: 'stc',color: Colors.red[700])),
                Text("New Death: "+widget.country.newDeaths,style: TextStyle(fontFamily: 'stc',color: Colors.red[700])),
                Text("Recovered Case: "+widget.country.totalRecovered,style: TextStyle(fontFamily: 'stc',color: Colors.green[700])),
                Text("New Recovered: "+widget.country.newRecovered,style: TextStyle(fontFamily: 'stc',color: Colors.green[700])),

              ],
            ),
          ),
        ],
      ),

    );
  }
}
