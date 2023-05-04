

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:quotes/core/server_locator/injection_container.dart';
import 'package:quotes/features/local_notification/data/data_resources/local_resource.dart';
import 'package:quotes/features/local_notification/data/models/notification_model.dart';
import 'package:quotes/features/local_notification/data/repositories/notification_repository_imp.dart';
import 'package:quotes/features/local_notification/domain/repositories/notificaiton_repository.dart';
import 'package:quotes/features/local_notification/domain/use_cases/enable_notification.dart';
import 'package:quotes/features/local_notification/domain/use_cases/init_notification.dart';
import 'package:quotes/features/local_notification/domain/use_cases/notification_enabled.dart';
import 'package:quotes/features/local_notification/presentation/cubit/notification_cubit.dart';

initNotificationInjectionContainer()
{
  serviceLocator.registerFactory(() => AppNotificationCubit(
      initNotificationUseCase: serviceLocator(),
      enableNotificationUseCase: serviceLocator(),
      notificationEnabledUseCase: serviceLocator(),
  ));
  serviceLocator.registerLazySingleton(() => InitNotification(appNotificationRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => EnableNotification(appNotificationRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => NotificationEnabled(appNotificationRepository: serviceLocator()));

  serviceLocator.registerLazySingleton<AppNotificationRepository>(() => AppNotificationRepositoryImpl(
      notificationManager: serviceLocator(),));

  serviceLocator.registerLazySingleton<NotificationManager>(() =>
  LocalNotification(
      flutterLocalNotificationsPlugin: serviceLocator(),
      initializationSettingsAndroid: serviceLocator(),
      initializationSettingsDarwin: serviceLocator(),
      initializationSettings: serviceLocator(),
      androidNotificationDetails: serviceLocator(),
      notificationDetails: serviceLocator(),
      appNotificationModel: serviceLocator(),
      sharedPreferences: serviceLocator(),)
  );
  serviceLocator.registerLazySingleton(() => FlutterLocalNotificationsPlugin());
  serviceLocator.registerLazySingleton(() =>
      const AndroidInitializationSettings('launch_background'));
  serviceLocator.registerLazySingleton(() => const DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: null));
  serviceLocator.registerLazySingleton(() =>  InitializationSettings(
      android: serviceLocator(),
      iOS: serviceLocator(),
     ));
  serviceLocator.registerLazySingleton(() => const AndroidNotificationDetails(
      '', '', channelDescription: 'repeating description'));
  serviceLocator.registerLazySingleton(() => NotificationDetails(android: serviceLocator()));

  serviceLocator.registerLazySingleton(() => const AppNotificationModel(
      id: 'id',
      title: 'title',
      body: 'body',
      payload: 'payload',));
}