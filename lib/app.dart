import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotes/features/app_language/data/data_resource/get_local_language.dart';
import 'package:quotes/features/app_language/presentation/cubit/language_cubit.dart';
import 'package:quotes/features/app_language/presentation/cubit/languuage_states.dart';
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
      builder: (_, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales:
            serviceLocator<GetLocalLanguage>().localization.supportedLocales,
        localizationsDelegates: serviceLocator<GetLocalLanguage>()
            .localization
            .localizationsDelegates,
        // title: AppStrings.appName,
        theme: appTheme(),
        home: const QuoteScreen(),
      ),
      buildWhen: (previousState, newState) => previousState != newState,
    );
  }
}
