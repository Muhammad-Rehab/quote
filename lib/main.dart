import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/app.dart';
import 'package:quotes/core/server_locator/injection_container.dart';
import 'package:quotes/features/quote_injection_container.dart';
import 'features/app_language/language_injection_container.dart';
import 'features/app_language/presentation/cubit/language_cubit.dart';
import 'features/random_quotes/presentaion/cubit/random_quote_cubit.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await superInjectionInit();
  await languageInjectionInit();
  await quoteInjectionInit();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<RandomQuoteCubit>(
          create: (_) => serviceLocator<RandomQuoteCubit>()),
      BlocProvider<LanguageCubit>(
          create: (_) => serviceLocator<LanguageCubit>()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  _initLocal() async
  {
    await BlocProvider.of<LanguageCubit>(context).callLanguage();
  }

  @override
  void initState()
  {
    _initLocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return const QuoteApp();
  }
}
