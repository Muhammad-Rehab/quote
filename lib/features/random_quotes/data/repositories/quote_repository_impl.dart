import'package:dartz/dartz.dart';
import 'package:quotes/core/errors/exceptions.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/api/network_info.dart';
import 'package:quotes/features/random_quotes/data/datasources/get_ramdon_remote_quote.dart';
import 'package:quotes/features/random_quotes/data/datasources/get_random_local_quote.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';
import 'package:quotes/features/random_quotes/domain/repositories/quote_repositories.dart';

class QuoteRepositoryImpl implements QuoteRepositories
{
  GetRandomLocalQuote getRandomLocalQuote;
  GetRandomRemoteQuote getRandomRemoteQuote;
  NetworkInfo networkInfo;

  QuoteRepositoryImpl({
    required this.getRandomRemoteQuote,
    required this.getRandomLocalQuote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected)
    {
      try
      {
        final remoteDataSource = await getRandomRemoteQuote.getRandomRemoteQuote();
        getRandomLocalQuote.cacheQuote(remoteDataSource);
        return Right(remoteDataSource);
      } on ServerException
      {
        return Left(ServerFailure());
      }
    } else
    {
      try {
        final cacheDataSource = await getRandomLocalQuote.getRandomLocalQuote();
        return Right(cacheDataSource);
      }
      catch(e)
      {
      return Left(CacheFailure());
      }
    }
  }
}
