
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/app_language/domain/repository/language_repository.dart';

class ChangeLanguage extends UseCase<Locale,NoParams>
{
  LanguageRepository languageRepository ;
  ChangeLanguage({required this.languageRepository});

  @override
  Future<Either<Failure,Locale>> call (NoParams params)=> languageRepository.toggleLanguage();
}