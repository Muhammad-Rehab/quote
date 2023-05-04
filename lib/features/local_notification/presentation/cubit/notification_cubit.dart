
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/local_notification/domain/use_cases/enable_notification.dart';
import 'package:quotes/features/local_notification/domain/use_cases/init_notification.dart';
import 'package:quotes/features/local_notification/domain/use_cases/notification_enabled.dart';
import 'package:quotes/features/local_notification/presentation/cubit/notification_state.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';

class AppNotificationCubit extends Cubit<AppNotificationState> {
  InitNotification initNotificationUseCase;

  EnableNotification enableNotificationUseCase;

  NotificationEnabled notificationEnabledUseCase;

  AppNotificationCubit({
    required this.initNotificationUseCase,
    required this.enableNotificationUseCase,
    required this.notificationEnabledUseCase,
  }) : super(NotificationInitialState());

  initNotificationSettings() async
  {
    emit(NotificationLoadingState());
    Either<Failure, void> response =
        await initNotificationUseCase.call(NoParams());
    emit(response.fold(
      (l) => NotificationErrorState(),
      (r) => NotificationInitialState(),
    ));
  }
  enableNotification(bool enable, int key, Quote quote) async
  {
    Either<Failure, void> response = await enableNotificationUseCase.call(enable, key, quote);
    emit(
      response.fold(
              (l) => NotificationErrorState(),
              (r) => NotificationEnabledState(),
      )
    );
  }
  isNotificationEnabled ()
  {
    Either<Failure,void> response = notificationEnabledUseCase.call(NoParams());
    emit(
      response.fold(
              (l) => NotificationErrorState(),
              (r) => NotificationLoadedState(),
      )
    );
  }
}
