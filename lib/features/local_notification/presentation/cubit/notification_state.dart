

import 'package:equatable/equatable.dart';

abstract class AppNotificationState extends Equatable
{
 @override
  List<Object?> get props => [];
}

class NotificationInitialState extends AppNotificationState{}

class NotificationLoadingState extends AppNotificationState{}

class NotificationLoadedState extends AppNotificationState{}

class NotificationEnabledState extends AppNotificationState {}

class NotificationErrorState extends AppNotificationState {}