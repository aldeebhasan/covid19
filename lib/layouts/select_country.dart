import 'package:covid19/apis/api.dart';
import 'package:covid19/entities/country.dart';
import 'package:covid19/lang/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectCountry extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Function updateLanguage;
  SelectCountry(this.updateLanguage);
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  bool start = true;
  Map data = {};
  List<Country> countries = [];
  List<Country> filtered_countries = [];

  Future<void> setCountry(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("country", name);
    Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
   if(start) {
     data = data.isNotEmpty ? data : ModalRoute
         .of(context)
         .settings
         .arguments;
     countries = data['countries'];
     filtered_countries = data['countries'];
     start = false;
   }
    return Scaffold(
        key: widget._scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.red[700],
          title: Text(
            Localization.translate(
                "select_title", Localizations.localeOf(context).languageCode),
            style: TextStyle(fontFamily: 'stc', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Image.asset("assets/images/lang.png"),
              onPressed: widget.updateLanguage),
        ),
        body: SafeArea(
            child:
            Column(
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
                      return Card(
                        elevation: 4,
                        child: ListTile(
                          onTap: (){
                            setCountry(filtered_countries[index].name);
                          },
                          title:  Text(filtered_countries[index].name),
                          trailing: Image(image: NetworkImage(filtered_countries[index].flag),height: 30,width: 50,fit: BoxFit.cover,),
                        )

                      );
                    }),
        ),
                ),
              ],
            )));
  }
}
