import 'package:flutter/material.dart';
import 'package:healtether/constants/themes.dart';
import 'package:healtether/models/appointment_user_model.dart';

class UpcomingScheduleWidget extends StatelessWidget {
  const UpcomingScheduleWidget({
    super.key,
    required this.users,
  });

  final List<AppointmentUserModel> users;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
          itemCount: users.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            return Container(
              width: size.width,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
                boxShadow: [
                  AppBoxShadow.s0BoxShadow(
                    color: Colors.black.withOpacity(0.056),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    color: AppTheme.appThemeColor,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Appointment Request',
                                  style: AppTextStyle.h4TextStyle(
                                      color: Colors.white70, size: 13.0),
                                ),
                                const SizedBox(height: 6.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.access_time_filled_sharp,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      '${users[index].date}, ${users[index].time} ',
                                      style: AppTextStyle.h4TextStyle(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            const Icon(
                              Icons.more_vert_rounded,
                              size: 18.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 46.0,
                              height: 46.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: AppDefaultTheme.appDefaultTheme,
                              ),
                              child: Icon(
                                Icons.person_rounded,
                                size: 20.0,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(users[index].name,
                                      style: AppTextStyle.h4TextStyle(
                                          fontWeight: FontWeight.w500)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        style: AppTextStyle.h4TextStyle(
                                            size: 12.0,
                                            color:
                                                AppTextTheme.appTextThemeLight),
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text:
                                                    'Age : ${users[index].age}'),
                                            const TextSpan(text: ' | '),
                                            TextSpan(text: users[index].gender),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Row(
                                        children: [
                                          Container(
                                            width: 8.0,
                                            height: 8.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    users[index].bookingType ==
                                                            'Virtually'
                                                        ? Colors.green.shade600
                                                        : Colors.blue.shade600),
                                          ),
                                          const SizedBox(width: 6.0),
                                          Text(users[index].bookingType,
                                              style: AppTextStyle.h4TextStyle(
                                                  size: 12.0,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: users[index].bookingType == 'Virtually'
                                  ? LabelWithIconButtonWidget(
                                      icon: Icons.videocam_rounded,
                                      label: 'Start Call',
                                      onTap: () {},
                                    )
                                  : LabelWithIconButtonWidget(
                                      label: 'Accept',
                                      onTap: () {},
                                    ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: LabelWithIconButtonWidget(
                                label: 'Decline',
                                bgColor: Colors.grey.shade200,
                                labelColor: Colors.black54,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class LabelWithIconButtonWidget extends StatelessWidget {
  const LabelWithIconButtonWidget({
    super.key,
    required this.onTap,
    this.icon,
    required this.label,
    this.bgColor = AppTheme.appThemeColor,
    this.labelColor = Colors.white,
  });

  final VoidCallback onTap;
  final IconData? icon;
  final String label;
  final Color? bgColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon == null
                ? Container()
                : Icon(icon, size: 22.0, color: Colors.white),
            icon == null ? Container() : const SizedBox(width: 10.0),
            Text(
              label,
              style: AppTextStyle.h4TextStyle(
                  color: labelColor, fontWeight: FontWeight.w500, size: 13.0),
            ),
          ],
        ),
      ),
    );
  }
}
