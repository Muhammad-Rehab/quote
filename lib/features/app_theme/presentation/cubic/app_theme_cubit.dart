

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/app_theme/data/models/theme_model.dart';
import 'package:quotes/features/app_theme/domain/use_cases/change_theme.dart';
import 'package:quotes/features/app_theme/domain/use_cases/get_app_theme.dart';
import 'package:quotes/features/app_theme/domain/use_cases/init_theme.dart';
import 'package:quotes/features/app_theme/presentation/cubic/app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> 
{
  final InitTheme initTheme ;
  final ChangeTheme changeTheme ;
  final GetAppTheme getAppTheme ;
  
  AppThemeCubit({required this.initTheme,required this.changeTheme , required this.getAppTheme}) : super(AppThemeInitialState());
  
  init () async
  {
    emit(AppThemeInitialState());
    Either<Failure,void> response = await initTheme.call(NoParams());
    emit(
      response.fold(
              (failure) =>  AppThemeErrorState(),
              (r) => AppThemeIsLoadedState(),
      )
    );
  }
  
   toggleAppTheme() async
  {
    emit(AppThemeInitialState());
   Either<Failure,AppThemeModel> response = await changeTheme.call(NoParams());
   emit(
     response.fold(
             (failure) => AppThemeErrorState(),
             (appThemeModel) => AppThemeIsChangedState(),
     )
   );
  }
  
  getThemeMode()
  {
    Either<Failure,AppThemeModel> response =  getAppTheme.call(NoParams());
    emit(
      response.fold(
              (failure) => AppThemeErrorState(), 
              (appThemeModel) => AppThemeIsLoadedState(),
      )
    );
  }
}