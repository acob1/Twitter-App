class NotificationModel {
  final String profileImageUrl;
  final String username;
  final String handle;
  final String time;
  final String notificationText;
  final bool isVerified;

  NotificationModel({
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.time,
    required this.notificationText,
    this.isVerified = false,
  });
}

final List<NotificationModel> notifications = [
  NotificationModel(
    profileImageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    username: 'Elon Musk',
    handle: 'elonmusk',
    time: '2m',
    notificationText: 'liked your tweet',
    isVerified: true,
  ),
  NotificationModel(
    profileImageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
    username: 'Jane Doe',
    handle: 'jane_doe',
    time: '10m',
    notificationText: 'mentioned you in a comment',
    isVerified: false,
  ),
  NotificationModel(
    profileImageUrl: 'https://randomuser.me/api/portraits/men/85.jpg',
    username: 'John Appleseed',
    handle: 'johnapple',
    time: '30m',
    notificationText: 'started following you',
    isVerified: true,
  ),
  NotificationModel(
    profileImageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
    username: 'Samantha Lee',
    handle: 'samanthalee',
    time: '1h',
    notificationText: 'retweeted your tweet',
    isVerified: false,
  ),
];
