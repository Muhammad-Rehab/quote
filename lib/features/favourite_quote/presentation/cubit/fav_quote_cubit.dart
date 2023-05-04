
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/favourite_quote/data/models/fav_quote_model.dart';
import 'package:quotes/features/favourite_quote/domain/use_cases/remove_fav_quote.dart';
import 'package:quotes/features/favourite_quote/presentation/cubit/fav_quotes_states.dart';

import '../../../../core/utilies/app_strings.dart';
import '../../domain/use_cases/get_fav_quotes.dart';
import '../../domain/use_cases/stor_fav_quote.dart';

class FavouriteQuoteCubit extends Cubit<FavouriteQuoteState>
{
  final GetFavouriteQuotes getFavouriteQuotesUseCase ;
  final StoreFavouriteQuotes storeFavouriteQuoteUseCase ;
  final RemoveFavQuote removeFavQuoteUseCase ;

  FavouriteQuoteCubit(
      {
        required this.getFavouriteQuotesUseCase,
        required this.storeFavouriteQuoteUseCase,
        required this.removeFavQuoteUseCase,
      }):
        super(FavouriteInitialState());

  getFavouriteQuotes () async
  {
    emit(FavouriteIsLoadingState());
    final Either<Failure,List<FavouriteQuoteModel>> response = await getFavouriteQuotesUseCase.call(NoParams());
    emit(
      response.fold(
              (failure) => FavouriteErrorState(msg: _mapFailureToMsg(failure)),
              (favouriteQuotes) => FavouriteLoadedState(favouriteQuotes: favouriteQuotes) ,
      )
    );
  }

  storeFavouriteQuotes (FavouriteQuoteModel favouriteQuoteModel) async
  {
    Either<Failure, bool> response = await storeFavouriteQuoteUseCase.call(favouriteQuoteModel);
    emit(
      response.fold(
              (failure) => FavouriteErrorState(msg: _mapFailureToMsg(failure)) ,
            (isStored) => FavouriteStoredState(isStored: isStored),
      )
    );
  }

  removeFavouriteQuote(FavouriteQuoteModel favouriteQuoteModel) async
  {
    emit(FavouriteIsLoadingState());
    Either<Failure,List<FavouriteQuoteModel>> response = await removeFavQuoteUseCase.call(favouriteQuoteModel);
    emit(
      response.fold(
              (left) => FavouriteErrorState(msg: AppStrings.cacheFailure),
              (favouriteQuotes) => FavouriteRemovedState(favouriteQuotes: favouriteQuotes),
      )
    );
  }
  String _mapFailureToMsg (Failure failure)
  {
    switch (failure.runtimeType)
    {
      case ServerFailure :
        return AppStrings.serverFailure;
      case CacheFailure :
        return AppStrings.cacheFailure ;
      default :
        return AppStrings.unExpectedFailure;
    }
  }
}