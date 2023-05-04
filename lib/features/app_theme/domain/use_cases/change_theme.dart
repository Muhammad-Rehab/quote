


import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/app_theme/data/models/theme_model.dart';
import 'package:quotes/features/app_theme/domain/repositories/app_theme_repository.dart';

class ChangeTheme implements UseCase<void,NoParams>
{
  final AppThemeRepository appThemeRepository ;
  const ChangeTheme({required this.appThemeRepository});

  @override
  Future<Either<Failure, AppThemeModel>> call(NoParams params) => appThemeRepository.toggleTheme();

}