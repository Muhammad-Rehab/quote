
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/core/utilies/app_strings.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';
import 'package:quotes/features/random_quotes/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_quotes/presentaion/cubit/randome_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState>
{
  final GetRandomQuote getRandomQuoteUseCase ;
  RandomQuoteCubit({required this.getRandomQuoteUseCase}):super(RandomQuoteInitial());

   getRandomQuote () async
  {
    emit(RandomQuoteIsLoading());
   final Either<Failure,Quote> response = await getRandomQuoteUseCase.call(NoParams());
   emit(
     response.fold(
             (failure) => RandomQuoteExceptionState(msg: _mapFailureToMsg(failure)),
             (quote) => RandomQuoteLoaded(quote: quote))
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