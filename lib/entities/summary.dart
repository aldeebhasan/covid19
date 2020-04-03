class Summary {
  String cases = "";
  String deaths = "";
  String recovered = "";
  String active = "";
  String affectedCountries = "";

  Summary(this.cases, this.deaths, this.recovered, this.active, this.affectedCountries);

  static Summary readJsonObj(Map data) {
    try {
      return new Summary(
          data['cases'].toString(),
          data['deaths'].toString(),
          data['recovered'].toString(),
          data['active'].toString(),
          data['affectedCountries'].toString());
    } on Exception {
      return new Summary("", "", "", "", "");
    }
  }
}
