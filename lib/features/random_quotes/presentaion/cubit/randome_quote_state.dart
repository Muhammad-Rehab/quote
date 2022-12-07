import 'package:equatable/equatable.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';

abstract class RandomQuoteState extends Equatable
{

  const RandomQuoteState();

  @override
  List<Object?> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState
{
  final Quote quote ;
  const RandomQuoteLoaded({required this.quote});

  @override
  List<Object?> get props => [quote];
}

class RandomQuoteExceptionState extends RandomQuoteState
{
  final String msg ;
  const RandomQuoteExceptionState({required this.msg});

  @override
  List<Object?> get props => [msg];
}
