
import'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:quotes/config/app_language/provided_language.dart';
import 'package:quotes/core/utilies/app_strings.dart';
import 'package:quotes/features/app_language/data/model/Language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class LocaleManager
{
  Future<Locale> initLocal ();
  Future<Locale> setLocal(String languageCode) ;
}

class GetLocalLanguage implements LocaleManager
{

  final FlutterLocalization localization ;
  LanguageModel languageModel ;
  SharedPreferences sharedPreference ;

  GetLocalLanguage({required this.sharedPreference,required this.languageModel,required this.localization});

  @override
  Future<Locale> initLocal() async
  {
    await localization.init(
        mapLocales: [
          const MapLocale(AppStrings.englishLanguageCode, AppLanguage.en),
          const MapLocale(AppStrings.arabicLanguageCode, AppLanguage.ar),
        ],
        initLanguageCode: AppStrings.englishLanguageCode,
    );
    await sharedPreference.setBool('isArabic',false);
    languageModel.locale = localization.currentLocale! ;
    return  languageModel.locale ;
  }

  bool isArabic()
  {
  bool isArabic =  sharedPreference.getBool('isArabic') ?? false ;
  return isArabic ;
  }

  @override
  Future<Locale> setLocal(String languageCode) async
  {
    if(languageCode == AppStrings.arabicLanguageCode){
      localization.translate(AppStrings.arabicLanguageCode);
      await sharedPreference.setBool('isArabic',true);
    }else
      {
        localization.translate(AppStrings.englishLanguageCode);
        await sharedPreference.setBool('isArabic',false);
      }
    languageModel.locale = localization.currentLocale!;
    return languageModel.locale;
  }

}