import 'package:flutter/material.dart';
import 'package:quotes/core/utilies/app_strings.dart';

appLightTheme()
{

  return ThemeData(
    primaryColor: const Color.fromRGBO(32, 32, 83, 1) ,
    hintColor: Colors.grey ,
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
      iconTheme: IconThemeData(color: Color.fromRGBO(32, 32, 83, 1)),
    ),
    iconTheme: const IconThemeData(size: 35, color: Colors.white),
    textTheme:const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 25 ,
        fontWeight: FontWeight.bold ,
      ),
      bodySmall:  TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
      ),
    )
  );
}

appDarkTheme ()
{
  return ThemeData(
      primaryColor: const Color.fromRGBO(3, 36, 31, 1) ,
      hintColor: Colors.grey ,
      brightness: Brightness.dark ,
      fontFamily: AppStrings.fontFamily ,
      appBarTheme:const AppBarTheme(
        elevation:  0 ,
        centerTitle: true ,
        titleTextStyle: TextStyle(
          fontSize: 24 ,
          fontWeight: FontWeight.bold ,
          color: Colors.white70 ,
        ),
        color: Colors.transparent ,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      iconTheme: const IconThemeData(size: 35, color: Colors.white),
      textTheme:const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 25 ,
          fontWeight: FontWeight.bold ,
        ),
        bodySmall:  TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white ,
        ),
      ),
  );
}