


import 'package:flutter/material.dart';
import 'package:quotes/core/server_locator/injection_container.dart';
import 'package:quotes/features/app_theme/data/data_sources/app_theme_data.dart';
import 'package:quotes/features/app_theme/data/models/theme_model.dart';
import 'package:quotes/features/app_theme/data/repositories/app_theme_repository_impl.dart';
import 'package:quotes/features/app_theme/domain/entities/appTheme.dart';
import 'package:quotes/features/app_theme/domain/repositories/app_theme_repository.dart';
import 'package:quotes/features/app_theme/domain/use_cases/change_theme.dart';
import 'package:quotes/features/app_theme/domain/use_cases/get_app_theme.dart';
import 'package:quotes/features/app_theme/domain/use_cases/init_theme.dart';
import 'package:quotes/features/app_theme/presentation/cubic/app_theme_cubit.dart';



themeInjectionInit ()
{
  serviceLocator.registerFactory(() => AppThemeCubit(
      initTheme: serviceLocator(),
      changeTheme: serviceLocator(),
      getAppTheme: serviceLocator(),
  ));
  serviceLocator.registerLazySingleton(() => InitTheme(appThemeRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => ChangeTheme(appThemeRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetAppTheme(appThemeRepository: serviceLocator()));

  serviceLocator.registerLazySingleton<AppThemeRepository>(() => AppThemeRepositoryImpl(
      dataAppTheme: serviceLocator()));
  serviceLocator.registerLazySingleton<DataAppTheme>(() => AppThemeDataImp(
    sharedPreferences: serviceLocator(),
    appThemeModel: serviceLocator(),
  ));

   serviceLocator.registerLazySingleton(() => AppThemeModel(themeMode: ThemeMode.light));

}