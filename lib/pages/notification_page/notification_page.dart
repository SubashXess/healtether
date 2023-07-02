import 'package:flutter/material.dart';
import 'package:healtether/constants/themes.dart';
import 'package:healtether/models/notification_model.dart';
import 'package:healtether/widgets/rounded_button_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late final List<NotificationModel> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = NotificationModel.generatedItem;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: SizedBox(
          width: size.width,
          height: 36.0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text('Notifications', style: AppTextStyle.h2TextStyle()),
              Positioned(
                  left: 0.0,
                  child: IconButtonWidget(
                      onTap: () => Navigator.pop(context),
                      icon: Icons.arrow_back_rounded)),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: List.generate(_notifications.length, (index) {
                return Container(
                  width: size.width,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  color: _notifications[index].isRead
                      ? null
                      : AppTheme.appThemeColor.withOpacity(0.2),
                  child: Row(
                    children: [
                      _notifications[index].isRead
                          ? Container()
                          : Container(
                              width: 10.0,
                              height: 10.0,
                              margin: const EdgeInsets.only(right: 16.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.appThemeColor,
                              ),
                            ),
                      Container(
                        width: 46.0,
                        height: 46.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppDefaultTheme.appDefaultTheme,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_notifications[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.h4TextStyle(
                                    fontWeight: FontWeight.w500)),
                            Text.rich(
                              style: AppTextStyle.h4TextStyle(
                                  size: 12.0,
                                  color: AppTextTheme.appTextThemeLight),
                              TextSpan(
                                children: [
                                  TextSpan(text: _notifications[index].msgType),
                                  const TextSpan(text: ' • '),
                                  TextSpan(
                                      text: _notifications[index].dateTime),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )),
      ),
    );
  }
}
