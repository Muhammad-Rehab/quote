
import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/favourite_quote/data/models/fav_quote_model.dart';
import 'package:quotes/features/favourite_quote/domain/repositories/fav_quote_repositry.dart';

class GetFavouriteQuotes extends UseCase<List<FavouriteQuoteModel>,NoParams>
{
  final FavouriteQuoteRepository favouriteQuoteRepository ;
  GetFavouriteQuotes({required this.favouriteQuoteRepository});

  @override
  Future<Either<Failure, List<FavouriteQuoteModel>>> call(NoParams params) =>
      favouriteQuoteRepository.getFavQuotes();

}