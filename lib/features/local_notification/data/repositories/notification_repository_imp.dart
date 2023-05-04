

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/features/local_notification/data/data_resources/local_resource.dart';
import 'package:quotes/features/local_notification/domain/repositories/notificaiton_repository.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';

class AppNotificationRepositoryImpl implements AppNotificationRepository
{
  final NotificationManager notificationManager;
  AppNotificationRepositoryImpl({required this.notificationManager});

  @override
  Future<Either<Failure, void>> init() async{
   try{
     return Right(await notificationManager.initNotifications());
   }catch(e)
    {
      return Left(CacheFailure());
    }
  }


  @override
  Future<Either<Failure, void>> enableNotifications(bool enable, int key, Quote quote) async{
    try{
      int key = UniqueKey().hashCode;
      return Right(await notificationManager.enableNotifications(enable, key, quote));
    }catch(e)
    {
      return Left(CacheFailure());
    }
  }

  @override
  Either<Failure, bool> isNotificationEnabled() {
    try{
      return Right( notificationManager.isNotificationsEnabled());
    }catch(e)
    {
    return Left(CacheFailure());
    }
  }

}