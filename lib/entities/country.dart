class Country{
  String name = "";
  String slug = "";
  String newConfirmed = "";
  String totalConfirmed = "";
  String newDeaths = "";
  String totalDeaths = "";
  String newRecovered = "";
  String totalRecovered = "";


  Country(this.name,this.slug,this.newConfirmed,this.totalConfirmed,
      this.newDeaths,this.totalDeaths,this.newRecovered,this.totalRecovered);


  static Country readJsonObj(Map data){
    try{
      return new Country(data['Country'].toString(), data['CountrySlug'].toString(), data['NewConfirmed'].toString(),
          data['TotalConfirmed'].toString(), data['NewDeaths'].toString(), data['TotalDeaths'].toString(),
          data['NewRecovered'].toString(), data['TotalRecovered'].toString());
    }on Exception{
      return new Country("", "", "", "", "", "", "", "");
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