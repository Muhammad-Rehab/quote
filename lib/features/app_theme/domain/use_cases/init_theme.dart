
import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/app_theme/domain/repositories/app_theme_repository.dart';

class InitTheme extends UseCase<void,NoParams>
{
  final AppThemeRepository appThemeRepository ;

  InitTheme({required this.appThemeRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) => appThemeRepository.initTheme();

}