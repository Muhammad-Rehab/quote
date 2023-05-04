
import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/features/favourite_quote/data/models/fav_quote_model.dart';

abstract class FavouriteQuoteRepository
{
  Future<Either<Failure, bool>> storeFavQuote(FavouriteQuoteModel favouriteQuoteModel);
  Future< Either<Failure,List<FavouriteQuoteModel>>> getFavQuotes();
  Future<Either<Failure,List<FavouriteQuoteModel>>> removeFavQuote(FavouriteQuoteModel favouriteQuoteModel);
}