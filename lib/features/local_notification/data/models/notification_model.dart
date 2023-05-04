import 'package:quotes/features/local_notification/domain/entities/notification.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';

class AppNotificationModel extends AppNotification {
  const AppNotificationModel(
      {required super.id,
      required super.title,
      required super.body,
      required super.payload});

  factory AppNotificationModel.fromQuote(Quote quote) {
    return AppNotificationModel(
      id: quote.id,
      title: quote.author,
      body: quote.content,
      payload: 'quote_payload',
    );
  }

  Quote notificationToQuote(AppNotificationModel appNotificationModel) {
    return Quote(author: appNotificationModel.title, id: appNotificationModel.id, content: appNotificationModel.body);
  }

}

