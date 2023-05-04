

import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/local_notification/domain/repositories/notificaiton_repository.dart';

class InitNotification extends UseCase<void,NoParams>
{
  AppNotificationRepository appNotificationRepository ;

  InitNotification({required this.appNotificationRepository});
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return appNotificationRepository.init();
  }

}