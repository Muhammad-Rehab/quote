

import 'package:dartz/dartz.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/local_notification/domain/repositories/notificaiton_repository.dart';

import '../../../../core/errors/failiers.dart';

class NotificationEnabled 
{
  AppNotificationRepository appNotificationRepository;
  NotificationEnabled({required this.appNotificationRepository});

  Either<Failure, bool> call(NoParams params) {
    return appNotificationRepository.isNotificationEnabled();
  }
}