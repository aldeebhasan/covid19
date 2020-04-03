import 'dart:convert';
import 'package:covid19/entities/country.dart';
import 'package:covid19/entities/summary.dart';
import 'package:http/http.dart';

class API{
  static String base ="https://api.covid19api.com/";

  static Future<List<Country>> getSummury() async{
    Response response = await get(base + "summary");
    Map data = jsonDecode(response.body);
    return Country.readJsonArray(data['Countries']);
  }

  static Future<Summary> getGeneralSummury() async{
    Response response = await get("https://corona.lmao.ninja/all");
    Map data = jsonDecode(response.body);
    return Summary.readJsonObj(data);
  }

}


