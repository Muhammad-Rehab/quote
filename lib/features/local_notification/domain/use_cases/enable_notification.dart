

import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/features/local_notification/domain/repositories/notificaiton_repository.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';

class EnableNotification
{
  AppNotificationRepository appNotificationRepository;
  EnableNotification({required this.appNotificationRepository});

  Future<Either<Failure, void>> call(bool enable,int key,Quote quote) {
    return appNotificationRepository.enableNotifications(enable, key, quote);
  }

}