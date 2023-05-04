
import 'package:equatable/equatable.dart';

import '../../data/models/fav_quote_model.dart';

class FavouriteQuoteState extends Equatable
{
  @override
  List<Object?> get props => [];
}

class FavouriteInitialState extends FavouriteQuoteState {}

class FavouriteIsLoadingState extends FavouriteQuoteState {}

class FavouriteLoadedState extends FavouriteQuoteState
{
  final List<FavouriteQuoteModel> favouriteQuotes ;
  FavouriteLoadedState({required this.favouriteQuotes});

  @override
  List<Object?> get props => [favouriteQuotes];
}

class FavouriteErrorState extends FavouriteQuoteState
{
  final String msg ;
  FavouriteErrorState({required this.msg});

}

class FavouriteStoredState extends FavouriteQuoteState
{
  final bool isStored ;
  FavouriteStoredState({required this.isStored});

  @override
  List<Object?> get props => [isStored];
}

class FavouriteRemovedState extends FavouriteQuoteState
{
  final List<FavouriteQuoteModel> favouriteQuotes ;
  FavouriteRemovedState({required this.favouriteQuotes});
  @override
  List<Object?> get props => [favouriteQuotes];
}