import 'package:flutter/material.dart';
import 'package:healtether/models/bottom_navbar_model.dart';
import 'package:healtether/pages/homepage/homepage.dart';
import 'package:healtether/pages/schedulepage/schedulepage.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_navbar_provider.dart';
import '../widgets/bottom_navbar_widget.dart';
import 'chatpage/chatpage.dart';
import 'profilepage/profilepage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late final PageStorageBucket _bucket;
  late final List<BottomNavBarModel> _navItem;

  final List<Widget> _page = [
    const HomePage(key: PageStorageKey('home-page')),
    const SchedulePage(key: PageStorageKey('schedule-page')),
    const ChatPage(key: PageStorageKey('chat-page')),
    const ProfilePage(key: PageStorageKey('profile-page')),
  ];

  @override
  void initState() {
    super.initState();
    _navItem = BottomNavBarModel.generatedItem;
    _bucket = PageStorageBucket();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final provider = context.read<BottomNavBarProvider>();
        if (provider.selectedIndex != 0) {
          provider.onSelected(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(
          size: MediaQuery.of(context).size,
          item: _navItem,
        ),
        body: Consumer<BottomNavBarProvider>(
          builder: (context, provider, child) => PageStorage(
            bucket: _bucket,
            child: _page[provider.selectedIndex],
          ),
        ),
      ),
    );
  }
}
