class Localization{

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'select_title': 'Select Your Country :',
      'home_title': 'CORONAVIRUS IN ',
      'home_global_title': 'CORONAVIRUS IN WORLD',
      'update_snb': 'Updating data...',
      'country_btn': "Show Countries Statistics",
      'guid_btn': "Comprehensive Outreach Guide",
      'emergency_btn': "Hospitals and emergency",
      'global_btn': "Show Global Statistics",
      'search_hint': 'Enter a search term',
      'country_effected': 'Country Effected',
      'total': 'Total',
      'today': 'Today',
      'today_death': 'Today Death',
      'active': 'Active',
      'recover': 'Recovered',
      'death': 'Death',
      'confirmed_case': 'Confirmed',
      'new_confirmed_case': 'New',
      'death_case': 'Death',
      'new_death_case': 'New',
      'recovered_case': 'Recovered',
      'new_recovered_case': 'New',
      'error': 'Error in loading data..try again',
      'retry': 'Reload',
      'note': 'The data included in this app is obtained immediately from THE GLOBAL HEALTH OBSERVATORY apis and we have no responsibility about any mistakes in the obtained data',
    },
    'ar': {
      'select_title': 'اختر دولتك : ',
      'home_title': 'وباء كورونا في سوريا',
      'home_global_title': 'وباء كورونا في العالم',
      'update_snb': 'جاري تحميل البيانات',
      'country_btn': "عرض احصائيات الدول",
      'guid_btn': "دليل التوعية الشامل",
      'emergency_btn': "المشافي والطوارئ",
      'global_btn': "عرض الاحصائيات العالمية",
      'search_hint': 'ادخل كلمة البحث',
      'country_effected': 'الدول المتأثرة',
      'total': 'الاجمالي',
      'today': 'اليوم',
      'today_death': 'وفيات اليوم',
      'active': 'النشطة',
      'recover': 'المعافاة',
      'death': 'الوفيات',
      'confirmed_case': ' المؤكدة',
      'new_confirmed_case':'الجديدة',
      'death_case': ' المتوفاة',
      'new_death_case': 'الجديدة',
      'recovered_case': ' المعافاة',
      'new_recovered_case': 'الجديدة',
      'error': 'مشكلة في جلب البيانات .. حاول مجددا',
      'retry': 'اعد المحاولة',
      'note': 'ان البيانات الموجودة في هذا التطبيق يتم الحصول عليها وتحديثها مباشرة من قبل منظمة الصحة العالمية ولا نتحمل مسؤولية اي خطأ وارد ضمنها',
    }
  };


  static String translate(String key,String locale){
    return _localizedValues[locale][key];
  }


}