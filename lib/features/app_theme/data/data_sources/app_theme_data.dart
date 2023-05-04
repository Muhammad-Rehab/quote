
import 'package:flutter/material.dart';
import 'package:quotes/features/app_theme/data/models/theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DataAppTheme
{
  Future<void> init();
  Future<AppThemeModel> toggle();
  AppThemeModel getThemeMode();
}

class AppThemeDataImp implements DataAppTheme
{
  final SharedPreferences sharedPreferences ;
  AppThemeModel appThemeModel ;
  AppThemeDataImp({required this.sharedPreferences, required this.appThemeModel});

  @override
  Future<void> init() async{
    if(sharedPreferences.getBool('isDark')??false)
      {
        appThemeModel.themeMode = ThemeMode.dark ;
      }else
        {
          appThemeModel.themeMode = ThemeMode.light ;
          await sharedPreferences.setBool('isDark', false);
        }

  }

  @override
  Future<AppThemeModel> toggle() async {
    if(appThemeModel.themeMode == ThemeMode.light)
    {
      appThemeModel.themeMode = ThemeMode.dark ;
      await sharedPreferences.setBool('isDark', true);
    } else 
      {
        appThemeModel.themeMode = ThemeMode.light ;
        await sharedPreferences.setBool('isDark', false);
       }
    return appThemeModel ;
  }

  @override
  AppThemeModel getThemeMode() {
    bool isDark =  sharedPreferences.getBool('isDark')!;
    if (isDark) 
    {
      appThemeModel.themeMode = ThemeMode.dark;
    } else 
      {
        appThemeModel.themeMode = ThemeMode.light ;
    }
    return appThemeModel;
  }

}