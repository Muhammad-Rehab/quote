

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppTheme extends  Equatable
{
  ThemeMode themeMode  ;
  AppTheme({required this.themeMode});

 @override
  List<Object?> get props => [themeMode];

}