
import 'package:quotes/features/favourite_quote/domain/entities/fav_quote.dart';

import '../../../random_quotes/domain/entities/quote.dart';

class FavouriteQuoteModel extends FavouriteQuote
{

  const FavouriteQuoteModel({required super.id, required super.author, required super.content});

  factory FavouriteQuoteModel.fromQuote(Quote quote)=> FavouriteQuoteModel(
    id: quote.id ,
    author: quote.author ,
    content: quote.content ,
  );

  factory FavouriteQuoteModel.fromJson(Map<String,dynamic> json)=> FavouriteQuoteModel(
      id: json['id'],
      author: json['author'],
      content: json['content'],
  );

  Map<String,dynamic> toJson() => {
    'id': id,
    'author':author,
    'content':content
  };
}
