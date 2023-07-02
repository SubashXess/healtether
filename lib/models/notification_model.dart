class NotificationModel {
  final String imgUrl;
  final String title;
  final String msgType;
  final String dateTime;
  final bool isRead;

  const NotificationModel(
      {required this.imgUrl,
      required this.title,
      required this.msgType,
      required this.dateTime,
      required this.isRead});

  static List<NotificationModel> generatedItem = [
    const NotificationModel(
        imgUrl: '',
        title: 'Doctor Samuel sent you a message',
        msgType: 'Medical',
        dateTime: 'Monday 4:17 PM',
        isRead: false),
    const NotificationModel(
        imgUrl: '',
        title: 'Set your schedule again',
        msgType: 'App',
        dateTime: 'Monday 3:34 PM',
        isRead: false),
    const NotificationModel(
        imgUrl: '',
        title: 'Confirm your Email address',
        msgType: 'Account',
        dateTime: 'Friday 10:00 AM',
        isRead: true),
    const NotificationModel(
        imgUrl: '',
        title: 'New clinic ready for patients',
        msgType: 'Announcement',
        dateTime: 'Friday 6:43 PM',
        isRead: true),
  ];
}
