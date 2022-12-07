
import 'package:dartz/dartz.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';
import 'package:quotes/features/random_quotes/domain/repositories/quote_repositories.dart';

import '../../../../core/errors/failiers.dart';


class GetRandomQuote extends UseCase<Quote,NoParams>
{

  final QuoteRepositories quoteRepositories ;
  GetRandomQuote({required this.quoteRepositories});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) => quoteRepositories.getRandomQuote() ;

}
