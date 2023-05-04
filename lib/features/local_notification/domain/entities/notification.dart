

import 'package:equatable/equatable.dart';

class AppNotification extends Equatable
{
  final String id;
  final String title ;
  final String body;
  final String payload;

  const AppNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  @override
  List<Object?> get props => [id,title,body,payload];

}