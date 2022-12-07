import 'package:quotes/features/random_quotes/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required super.author,
      required super.id,
      required super.content,
      });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json['author'],
        id: json['_id'],
        content: json['content'],
      );

  Map<String, dynamic> toJson() =>
      {'author': author, '_id': id, 'content': content,};
}
