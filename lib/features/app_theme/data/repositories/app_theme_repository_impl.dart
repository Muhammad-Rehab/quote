

import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/features/app_theme/data/data_sources/app_theme_data.dart';
import 'package:quotes/features/app_theme/data/models/theme_model.dart';
import 'package:quotes/features/app_theme/domain/repositories/app_theme_repository.dart';

class AppThemeRepositoryImpl implements AppThemeRepository
{
  final DataAppTheme dataAppTheme ;
  AppThemeRepositoryImpl({required this.dataAppTheme});

  @override
  Future<Either<Failure, void>> initTheme() async
  {
   try
   {
     return Right(await dataAppTheme.init())  ;
   }
   catch(e)
    {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, AppThemeModel>> toggleTheme() async
  {
    try
    {
      return Right(await dataAppTheme.toggle())  ;
    }
    catch(e)
    {
    return Left(CacheFailure());
    }
  }

  @override
  Either<Failure, AppThemeModel> getTheme() {
    try
    {
      return Right( dataAppTheme.getThemeMode())  ;
    }
    catch(e)
    {
    return Left(CacheFailure());
    }
  }

}