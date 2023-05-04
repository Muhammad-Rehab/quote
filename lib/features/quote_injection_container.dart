import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/dio_impl.dart';
import 'package:quotes/core/api/network_info.dart';
import 'package:quotes/core/server_locator/injection_container.dart';
import 'package:quotes/features/random_quotes/data/datasources/get_ramdon_remote_quote.dart';
import 'package:quotes/features/random_quotes/data/datasources/get_random_local_quote.dart';
import 'package:quotes/features/random_quotes/data/repositories/quote_repository_impl.dart';
import 'package:quotes/features/random_quotes/domain/repositories/quote_repositories.dart';
import 'package:quotes/features/random_quotes/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_quotes/presentaion/cubit/random_quote_cubit.dart';



quoteInjectionInit()
{
  // Features
  serviceLocator.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetRandomQuote(quoteRepositories: serviceLocator()));
  serviceLocator.registerLazySingleton<QuoteRepositories>(() => QuoteRepositoryImpl(
        getRandomRemoteQuote: serviceLocator(),
        getRandomLocalQuote: serviceLocator(),
        networkInfo: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<GetRandomRemoteQuote>(
      () => GetRandomRemoteQuoteImpl(client: serviceLocator()));
  serviceLocator.registerLazySingleton<GetRandomLocalQuote>(
      () => GetRandomLocalQuoteImpl(sharedPreferences: serviceLocator()));

  // Core
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: serviceLocator()));
  serviceLocator.registerLazySingleton<ApiConsumer>(() => DioImplementation(client: serviceLocator()));



}
