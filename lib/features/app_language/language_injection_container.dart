
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:quotes/core/server_locator/injection_container.dart';
import 'package:quotes/features/app_language/data/data_resource/get_local_language.dart';
import 'package:quotes/features/app_language/data/model/Language_model.dart';
import 'package:quotes/features/app_language/data/repositry/language_repository_impl.dart';
import 'package:quotes/features/app_language/domain/repository/language_repository.dart';
import 'package:quotes/features/app_language/domain/usecase/chang_language.dart';
import 'package:quotes/features/app_language/domain/usecase/init_language.dart';
import 'package:quotes/features/app_language/presentation/cubit/language_cubit.dart';


languageInjectionInit ()
{
  serviceLocator.registerFactory(() => LanguageCubit(
      initLanguage: serviceLocator(),
      changeLanguage: serviceLocator()));

  serviceLocator.registerLazySingleton(() => InitLanguage(languageRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => ChangeLanguage(languageRepository: serviceLocator()));

  serviceLocator.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(getLocalLanguage: serviceLocator()));

  serviceLocator.registerLazySingleton(() => GetLocalLanguage(
      sharedPreference: serviceLocator(),
      languageModel: serviceLocator(),
      localization: serviceLocator()),);

  serviceLocator.registerLazySingleton(() => LanguageModel(locale: serviceLocator()));
  serviceLocator.registerLazySingleton(() => const Locale('en'));

   final FlutterLocalization localization =  FlutterLocalization.instance ;
  serviceLocator.registerLazySingleton(() => localization);


}