
import 'package:equatable/equatable.dart';

class Quote extends Equatable
{
  final String author ;
  final String id ;
  final String content ;

  const Quote(
      {
        required this.author,
        required this.id,
        required this.content,
      });


  @override
  List<Object?> get props => [author,id,content];

}