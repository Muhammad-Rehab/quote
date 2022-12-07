
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/utilies/app_strings.dart';
import 'package:quotes/features/app_language/data/data_resource/get_local_language.dart';
import 'package:quotes/features/app_language/domain/repository/language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository
{

  GetLocalLanguage getLocalLanguage ;
  LanguageRepositoryImpl({required this.getLocalLanguage});


  @override
  Future<Either<Failure, Locale>> toggleLanguage() async{
    try
    {
      Locale locale ;
      if( getLocalLanguage.isArabic())
        {
          locale = await getLocalLanguage.local(AppStrings.englishLanguageCode);
        }else
          {
            locale = await getLocalLanguage.local(AppStrings.arabicLanguageCode);
          }
      return Right(locale);
    }
    catch (e)
    {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure,Locale>> initLanguage()async {
    try
    {
      Locale locale = await getLocalLanguage.initLocal();
      return Right(locale) ;
    }
    catch(e)
    {
        debugPrint(e.toString());
        return Left(CacheFailure());
    }
  }

}