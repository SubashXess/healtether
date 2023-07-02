import 'package:flutter/material.dart';
import 'package:healtether/constants/themes.dart';
import 'package:healtether/models/appointment_user_model.dart';

import 'components/schedule_widget.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final List<AppointmentUserModel> _appointmentUsers;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _appointmentUsers = AppointmentUserModel.generatedItem;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        title: Text('Schedule', style: AppTextStyle.h2TextStyle()),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            width: size.width,
            height: kToolbarHeight - 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              border: Border.all(width: 1.0, color: Colors.black12),
              boxShadow: [
                AppBoxShadow.s0BoxShadow(color: Colors.black.withOpacity(0.056))
              ],
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black45,
              indicatorColor: AppTheme.appThemeColor,
              padding: const EdgeInsets.all(5.0),
              labelPadding: EdgeInsets.zero,
              indicatorWeight: 0.0,
              indicatorPadding: EdgeInsets.zero,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.0),
                  color: AppTheme.appThemeColor),
              labelStyle: AppTextStyle.h4TextStyle(fontWeight: FontWeight.w500),
              unselectedLabelStyle:
                  AppTextStyle.h5TextStyle(fontWeight: FontWeight.w400),
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'Completed'),
                Tab(text: 'Cancelled'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          UpcomingScheduleWidget(users: _appointmentUsers),
          const Center(child: Text('Completed')),
          const Center(child: Text('Cancelled')),
        ],
      ),
    );
  }
}
