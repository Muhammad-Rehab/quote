import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/features/favourite_quote/data/data_resources/local_data.dart';
import 'package:quotes/features/favourite_quote/data/models/fav_quote_model.dart';
import 'package:quotes/features/favourite_quote/domain/repositories/fav_quote_repositry.dart';


class FavouriteQuoteRepositoryImpl implements FavouriteQuoteRepository {

  final LocalFavQuote localFavQuote ;
  FavouriteQuoteRepositoryImpl(this.localFavQuote);

  @override
  Future<Either<Failure, List<FavouriteQuoteModel>>> getFavQuotes() async
  {
    try
    {
     List<FavouriteQuoteModel> favouriteQuotes = await localFavQuote.getFavQuotes();
     return Right(favouriteQuotes) ;
    }
    catch (e)
    {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure,bool>> storeFavQuote(FavouriteQuoteModel favouriteQuoteModel) async
  {
    try
    {
      bool isStored = await localFavQuote.storeFavQuote(favouriteQuoteModel);
      return Right(isStored);
    }
    catch (e)
    {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<FavouriteQuoteModel>>> removeFavQuote(FavouriteQuoteModel favouriteQuoteModel) async
  {
    try{
      return Right(await localFavQuote.removeFavQuote(favouriteQuoteModel));
    }
    catch(e)
    {
      return Left(CacheFailure());
    }
  }

}
