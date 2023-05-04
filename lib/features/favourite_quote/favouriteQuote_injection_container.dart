

import 'package:flutter/foundation.dart';
import 'package:quotes/core/server_locator/injection_container.dart';
import 'package:quotes/features/favourite_quote/data/data_resources/local_data.dart';
import 'package:quotes/features/favourite_quote/data/repositories/fav_quote_repositry_impl.dart';
import 'package:quotes/features/favourite_quote/domain/repositories/fav_quote_repositry.dart';
import 'package:quotes/features/favourite_quote/domain/use_cases/get_fav_quotes.dart';
import 'package:quotes/features/favourite_quote/domain/use_cases/remove_fav_quote.dart';
import 'package:quotes/features/favourite_quote/domain/use_cases/stor_fav_quote.dart';
import 'package:quotes/features/favourite_quote/presentation/cubit/fav_quote_cubit.dart';

favouriteQuoteInjectionInit()
{
  serviceLocator.registerFactory(() => FavouriteQuoteCubit(getFavouriteQuotesUseCase: serviceLocator(),
      storeFavouriteQuoteUseCase: serviceLocator(),removeFavQuoteUseCase: serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetFavouriteQuotes(favouriteQuoteRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => StoreFavouriteQuotes(favouriteQuoteRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => RemoveFavQuote(favouriteQuoteRepository: serviceLocator()));
  serviceLocator.registerLazySingleton<FavouriteQuoteRepository>(() => FavouriteQuoteRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<LocalFavQuote>(() => LocalFavQuoteImp(
      sharedPreference: serviceLocator()));
}