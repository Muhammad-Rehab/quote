import 'package:flutter/material.dart';
import 'package:quotes/core/utilies/app_colors.dart';
import 'package:quotes/core/utilies/app_strings.dart';

appTheme ()
{
  return ThemeData(
    primaryColor: AppColors.primary ,
    hintColor: AppColors.hint ,
    brightness: Brightness.light ,
    fontFamily: AppStrings.fontFamily ,
    appBarTheme:const AppBarTheme(
      elevation:  0 ,
      centerTitle: true ,
      titleTextStyle: TextStyle(
        fontSize: 22 ,
        fontWeight: FontWeight.bold ,
        color: Color.fromRGBO(32, 32, 83, 1) ,
      ),
      color: Colors.transparent ,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black ,
      textTheme: ButtonTextTheme.primary ,
    ),
    textTheme:const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 25 ,
        fontWeight: FontWeight.bold ,
      )
    )
  );
}