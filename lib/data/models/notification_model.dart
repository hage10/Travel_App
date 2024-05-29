import 'dart:io';

class NotificationModel {
  final int id;
  final String title;
  final String body;
  final DateTime dateTime;
  final File? image;
  final String code;
  final String fromUser;
  final String toUser;
  bool seen;

  NotificationModel({
    required this.id,
    this.image,
    required this.code,
    required this.fromUser,
    required this.toUser,
    required this.title,
    required this.body,
    required this.dateTime,
    required this.seen,
  });
}

// Dữ liệu thông báo mẫu
List<NotificationModel> notifications = [
  NotificationModel(
    id: 1,
    code: 'CODE123',
    fromUser: 'userA',
    toUser: 'userB',
    title: 'New Message Received',
    body: 'You have a new message from userA.',
    dateTime: DateTime.now().subtract(const Duration(minutes: 15)),
    seen: false,
  ),
  NotificationModel(
    id: 2,
    code: 'CODE456',
    fromUser: 'admin',
    toUser: 'userC',
    title: 'System Maintenance',
    body: 'The system will undergo maintenance at midnight.',
    dateTime: DateTime.now().subtract(const Duration(hours: 1)),
    seen: false,
  ),
  NotificationModel(
    id: 3,
    code: 'CODE789',
    fromUser: 'userD',
    toUser: 'userE',
    title: 'Friend Request',
    body: 'userD has sent you a friend request.',
    dateTime: DateTime.now().subtract(const Duration(days: 1)),
    seen: false,
  ),
  NotificationModel(
    id: 4,
    code: 'CODE101',
    fromUser: 'userF',
    toUser: 'userG',
    title: 'Event Reminder',
    body: 'Don\'t forget the meeting tomorrow at 10 AM.',
    dateTime: DateTime.now().subtract(const Duration(hours: 20)),
    seen: false,
  ),
  NotificationModel(
    id: 5,
    code: 'CODE202',
    fromUser: 'userH',
    toUser: 'userI',
    title: 'Promotion Alert',
    body: 'Congratulations! You have been promoted.',
    dateTime: DateTime.now().subtract(const Duration(days: 2)),
    seen: false,
  ),
  NotificationModel(
    id: 6,
    code: 'CODE303',
    fromUser: 'userJ',
    toUser: 'userK',
    title: 'New Comment',
    body: 'userJ commented on your post.',
    dateTime: DateTime.now().subtract(const Duration(minutes: 45)),
    seen: false,
  ),
  NotificationModel(
    id: 7,
    code: 'CODE404',
    fromUser: 'system',
    toUser: 'userL',
    title: 'Password Change',
    body: 'Your password was changed successfully.',
    dateTime: DateTime.now().subtract(const Duration(hours: 3)),
    seen: false,
  ),
  NotificationModel(
    id: 8,
    code: 'CODE505',
    fromUser: 'userM',
    toUser: 'userN',
    title: 'New Like',
    body: 'userM liked your photo.',
    dateTime: DateTime.now().subtract(const Duration(minutes: 10)),
    seen: false,
  ),
  NotificationModel(
    id: 9,
    code: 'CODE606',
    fromUser: 'userO',
    toUser: 'userP',
    title: 'Birthday Reminder',
    body: 'Today is userO\'s birthday. Wish them a happy birthday!',
    dateTime: DateTime.now().subtract(const Duration(hours: 7)),
    seen: false,
  ),
  NotificationModel(
    id: 10,
    code: 'CODE707',
    fromUser: 'admin',
    toUser: 'allUsers',
    title: 'Welcome New Users',
    body: 'Welcome to the community! We are glad to have you.',
    dateTime: DateTime.now().subtract(const Duration(days: 3)),
    seen: false,
  ),
];
