import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:healtether/constants/themes.dart';
import 'package:healtether/models/home_service_model.dart';
import 'package:healtether/models/video_models.dart';
import 'package:healtether/pages/notification_page/notification_page.dart';
import 'package:healtether/pages/search_page/search_page.dart';
import 'package:healtether/utilities/navigators.dart';

import '../../widgets/drawer_widgets.dart';
import '../../widgets/rounded_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late final List<HomeServiceModel> _services;
  late final List<VideoModel> _videos;

  @override
  void initState() {
    super.initState();
    _services = HomeServiceModel.generatedItem;
    _videos = VideoModel.generatedItem;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButtonWidget(
                      icon: Icons.menu_rounded,
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                    Row(
                      children: [
                        IconButtonWidget(
                          icon: Icons.search_rounded,
                          onTap: () =>
                              navigatorPush(context, const SearchPage()),
                        ),
                        const SizedBox(width: 10.0),
                        IconButtonWidget(
                          icon: Icons.notifications_rounded,
                          badgeShow: true,
                          badgeLabel: '2',
                          onTap: () {
                            navigatorPush(context, const NotificationPage());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello',
                        style: AppTextStyle.h2TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54)),
                    Text('Dr. Arjun Krishna',
                        style: AppTextStyle.h2TextStyle()),
                  ],
                ),
              ),
              SizedBox(
                width: size.width,
                height: 146.0,
                child: CarouselSlider.builder(
                  itemCount: _bannerItem.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppDefaultTheme.appDefaultTheme,
                          boxShadow: [
                            AppBoxShadow.s0BoxShadow(
                                color: Colors.black.withOpacity(0.056))
                          ]),
                      child: Image.asset(_bannerItem[index], fit: BoxFit.fill),
                    );
                  },
                  options: CarouselOptions(
                    height: 146.0,
                    aspectRatio: 16.9,
                    clipBehavior: Clip.none,
                    viewportFraction: 1.0,
                    disableCenter: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: size.width,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Services',
                        style: AppTextStyle.h3TextStyle(
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10.0),
                    GridView.builder(
                      itemCount: _services.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 16.0,
                        mainAxisExtent: 120.0,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: size.width,
                              height: 80.0,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              padding: const EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1.0, color: Colors.black12),
                                  boxShadow: [
                                    AppBoxShadow.s0BoxShadow(
                                        color: Colors.black.withOpacity(0.056))
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Image.asset(
                                    _services[index].imgPath,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(_services[index].label,
                                style: AppTextStyle.h4TextStyle(size: 13.0)),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Demo Videos',
                          style: AppTextStyle.h3TextStyle(
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: size.width,
                      height: 124.0,
                      child: ListView.builder(
                        itemCount: _videos.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 16.0),
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: size.width * 0.65,
                            height: 124.0,
                            margin: const EdgeInsets.only(right: 16.0),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: AppDefaultTheme.appDefaultTheme,
                              boxShadow: [
                                AppBoxShadow.s0BoxShadow(
                                    color: Colors.black.withOpacity(0.056))
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: size.width,
                                  height: 124.0,
                                  child: Image.asset(
                                    _videos[index].img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ClipRRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 6.0, sigmaY: 6.0),
                                      child: Container(
                                        width: size.width,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 4.0),
                                        decoration: const BoxDecoration(
                                            color: Colors.white38),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(_videos[index].title,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppTextStyle
                                                      .h5TextStyle()),
                                            ),
                                            const SizedBox(width: 10.0),
                                            Container(
                                              width: 32.0,
                                              height: 32.0,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      AppTheme.appThemeColor),
                                              child: const Icon(
                                                Icons.play_arrow_rounded,
                                                size: 20.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final _bannerItem = [
    'assets/images/banner-1.jpg',
    'assets/images/banner-2.jpg',
    'assets/images/banner-3.jpg',
    'assets/images/banner-4.jpg',
  ];
}
