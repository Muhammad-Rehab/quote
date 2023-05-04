import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/app_language/presentation/cubit/languuage_states.dart';

import '../../../../core/errors/failiers.dart';
import '../../domain/usecase/chang_language.dart';
import '../../domain/usecase/init_language.dart';

class LanguageCubit extends Bloc<LanguageCubit,LanguageState>
{

  InitLanguage initLanguage;
  ChangeLanguage changeLanguage;

  LanguageCubit({
    required this.initLanguage,
    required this.changeLanguage,
  }) : super(InitialState());

   callLanguage () async
  {
    Either<Failure,Locale> response = await initLanguage.call();
    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      response.fold(
            (failure) => const LanguageCacheErrorState(message: 'Cache Failure Error'),
            (locale) => LanguageChangedState(locale: locale),
      ),
    );
  }

  toggleLanguage () async
  {
    Either<Failure,Locale> response = await changeLanguage.call(NoParams()) ;
    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      response.fold(
            (failure) => const LanguageCacheErrorState(message: 'Cache Failure Error'),
            (locale) => LanguageChangedState(locale: locale),
      ),
    );
  }
}
