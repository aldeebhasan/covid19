class Country{
  String name = "";
  String cases = "";
  String todayCases = "";
  String deaths = "";
  String todayDeaths = "";
  String recovered = "";
  String active = "";
  ////optional
  String critical = "";
  String flag = "";
//  String deathsPerOneMillion = "";


  Country(this.name,this.cases,this.todayCases,
      this.deaths,this.todayDeaths,this.recovered,this.active,this.critical,this.flag);


  static Country readJsonObj(Map data){
    try{
      return new Country(data['country'].toString(), data['cases'].toString(), data['todayCases'].toString(),
          data['deaths'].toString(), data['todayDeaths'].toString(), data['recovered'].toString(),
          data['active'].toString(), data['critical'].toString(),data['countryInfo']['flag'].toString());
    }on Exception{
      return new Country("", "", "", "", "", "", "", "", "");
    }

  }

  static List<Country> readJsonArray(List data){
    List<Country> list= [];

    for(int i=0;i<data.length ;i++){
      if(data[i]["Country"].toString()!="") {
        list.add(readJsonObj(data[i]));
      }
    }

  return list;
  }


}