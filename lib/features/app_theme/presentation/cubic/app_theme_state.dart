

import 'package:equatable/equatable.dart';
import 'package:quotes/features/app_theme/data/models/theme_model.dart';
import 'package:quotes/features/app_theme/domain/entities/appTheme.dart';


abstract class AppThemeState extends Equatable
{
  const AppThemeState();

  @override
  List<Object?> get props => [];
}

class AppThemeInitialState extends AppThemeState{}

class AppThemeIsChangedState extends AppThemeState {}

class AppThemeIsLoadedState extends AppThemeState {}

class AppThemeErrorState extends AppThemeState{}