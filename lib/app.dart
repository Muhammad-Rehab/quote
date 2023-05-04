import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quotes/features/app_language/data/data_resource/get_local_language.dart';
import 'package:quotes/features/app_language/presentation/cubit/language_cubit.dart';
import 'package:quotes/features/app_language/presentation/cubit/languuage_states.dart';
import 'package:quotes/features/app_theme/data/models/theme_model.dart';
import 'package:quotes/features/app_theme/presentation/cubic/app_theme_cubit.dart';
import 'package:quotes/features/app_theme/presentation/cubic/app_theme_state.dart';
import 'package:quotes/features/random_quotes/presentaion/screens/quote_screen.dart';

import 'config/app_theme.dart';
import 'core/server_locator/injection_container.dart';


class QuoteApp extends StatefulWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  State<QuoteApp> createState() => _QuoteAppState();
}

class _QuoteAppState extends State<QuoteApp>
{
  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (_, sta) => BlocBuilder<AppThemeCubit,AppThemeState>(
          builder:(_,state)=> ScreenUtilInit(
            builder: (context ,_) => MaterialApp(
                debugShowCheckedModeBanner: false,
                supportedLocales: serviceLocator<GetLocalLanguage>().localization.supportedLocales,
                localizationsDelegates: serviceLocator<GetLocalLanguage>()
                    .localization
                    .localizationsDelegates,
                // title: AppStrings.appName,
                themeMode: serviceLocator<AppThemeModel>().themeMode,
                theme: appLightTheme(),
                darkTheme: appDarkTheme(),
                home: const QuoteScreen(),
              ),
          ) ,
        buildWhen: (previousState,currentState)=> previousState != currentState ,
      ),
      buildWhen: (previousState, newState) => previousState != newState,
    );
  }
}
