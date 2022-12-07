
import 'package:dartz/dartz.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';

import '../../../../core/errors/failiers.dart';

abstract class QuoteRepositories
{
  Future<Either<Failure,Quote>> getRandomQuote () ;
}