

import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/app_theme/data/models/theme_model.dart';
import 'package:quotes/features/app_theme/domain/repositories/app_theme_repository.dart';

class GetAppTheme
{
  final AppThemeRepository appThemeRepository ;
  const GetAppTheme({required this.appThemeRepository});


  Either<Failure, AppThemeModel> call(NoParams params) {
  return appThemeRepository.getTheme();
  }

}