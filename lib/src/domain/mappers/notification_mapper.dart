

import 'package:clean_architecture/src/common/utils/date.dart';
import 'package:clean_architecture/src/domain/models/network/notification_response.dart';

import '../models/ui/notification.dart';
import 'base_mapper.dart';

class NotificationMapper
    extends Mapper<NotificationResponse, UserNotification> {
  @override
  UserNotification map(NotificationResponse data) {
    return UserNotification(
      id: data.id,
      content: data.content,
      isRead: data.isRead,
      timeCreate: data.timeCreate.toDate(),
    );
  }
}
