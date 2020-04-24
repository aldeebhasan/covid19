import 'dart:convert';
import 'package:covid19/entities/country.dart';
import 'package:covid19/entities/summary.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIResponce {
  bool status = false;
  dynamic data;

  APIResponce(this.status, this.data);
}

class API {
  static String base = "";

  static Future<APIResponce> getSummury() async {
    Response response = await get("https://corona.lmao.ninja/v2/countries");
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return APIResponce(true, Country.readJsonArray(data));
    } else {
      return APIResponce(false, []);
    }
  }

  static Future<APIResponce> getGeneralSummury() async {
    Response response = await get("https://corona.lmao.ninja/v2/all");
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      return APIResponce(true, Summary.readJsonObj(data));
    } else {
      return APIResponce(false, []);
    }
  }

  static Future<APIResponce> getCountrySummury() async {
    final prefs = await SharedPreferences.getInstance();
    Response response = await get("https://corona.lmao.ninja/v2/countries/${prefs.get("country")}");


    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      return  APIResponce(true, Country.readJsonObj(data));
    } else {
      return APIResponce(false, []);
    }
  }
}
