import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/app.dart';
import 'package:quotes/core/server_locator/injection_container.dart';
import 'package:quotes/features/app_theme/presentation/cubic/app_theme_cubit.dart';
import 'package:quotes/features/app_theme/theme_injection_container.dart';
import 'package:quotes/features/favourite_quote/favouriteQuote_injection_container.dart';
import 'package:quotes/features/favourite_quote/presentation/cubit/fav_quote_cubit.dart';
import 'package:quotes/features/local_notification/notification_injection_container.dart';
import 'package:quotes/features/local_notification/presentation/cubit/notification_cubit.dart';
import 'package:quotes/features/quote_injection_container.dart';
import 'features/app_language/language_injection_container.dart';
import 'features/app_language/presentation/cubit/language_cubit.dart';
import 'features/random_quotes/presentaion/cubit/random_quote_cubit.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await superInjectionInit();
  languageInjectionInit();
  quoteInjectionInit();
  favouriteQuoteInjectionInit();
  themeInjectionInit();
  initNotificationInjectionContainer();

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<RandomQuoteCubit>(
          create: (_) => serviceLocator<RandomQuoteCubit>()),
      BlocProvider<LanguageCubit>(
          create: (_) => serviceLocator<LanguageCubit>()),
      BlocProvider<FavouriteQuoteCubit>(
          create: (_) => serviceLocator<FavouriteQuoteCubit>()),
      BlocProvider<AppThemeCubit>(
          create: (_) => serviceLocator<AppThemeCubit>()),
      BlocProvider<AppNotificationCubit>(
          create: (_) => serviceLocator<AppNotificationCubit>()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _initLocal() async
  {
    await BlocProvider.of<LanguageCubit>(context).callLanguage();
  }

  _initTheme() async
  {
    await BlocProvider.of<AppThemeCubit>(context).init();
  }

  _initNotification () async
  {
    BlocProvider.of<AppNotificationCubit>(context).initNotificationSettings();
  }

  @override
  void initState()
  {
    _initLocal();
    _initTheme();
    _initNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return const QuoteApp();
  }

}
