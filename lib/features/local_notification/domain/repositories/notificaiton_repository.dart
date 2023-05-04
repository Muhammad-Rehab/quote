

import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';

abstract class AppNotificationRepository
{
  Future<Either<Failure,void>> init();
  Future<Either<Failure,void>> enableNotifications(bool enable,int key,Quote quote);
  Either<Failure,bool> isNotificationEnabled();
}