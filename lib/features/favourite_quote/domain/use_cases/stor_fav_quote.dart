
import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/favourite_quote/domain/repositories/fav_quote_repositry.dart';

import '../../data/models/fav_quote_model.dart';


class StoreFavouriteQuotes extends UseCase<void,FavouriteQuoteModel>
{
  final FavouriteQuoteRepository favouriteQuoteRepository ;

  StoreFavouriteQuotes({required this.favouriteQuoteRepository});

  @override
  Future<Either<Failure, bool>> call(params) =>
      favouriteQuoteRepository.storeFavQuote(params);

}