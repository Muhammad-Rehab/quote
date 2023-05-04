

import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/features/app_theme/data/models/theme_model.dart';

abstract class AppThemeRepository {

  Future<Either<Failure,void>> initTheme();
  Either<Failure,AppThemeModel> getTheme();
  Future<Either<Failure,AppThemeModel>> toggleTheme();
}