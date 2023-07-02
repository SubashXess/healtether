import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/themes.dart';
import '../models/bottom_navbar_model.dart';
import '../providers/bottom_navbar_provider.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.size,
    required this.item,
  });

  final Size size;
  final List<BottomNavBarModel> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          AppBoxShadow.s0BoxShadow(
            color: Colors.black.withOpacity(0.036),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
          item.length,
          (index) => Expanded(
            child:
                Consumer<BottomNavBarProvider>(builder: (context, provider, _) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  provider.onSelected(index);
                },
                child: Container(
                  height: 60.0,
                  width: size.width,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.loose,
                    children: [
                      AnimatedContainer(
                        width: size.width,
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.fastEaseInToSlowEaseOut,
                        transform: Matrix4.translationValues(0,
                            provider.selectedIndex == index ? -5.0 : 0.0, 0.0),
                        child: Icon(
                          item[index].icon,
                          color: provider.selectedIndex == index
                              ? AppTheme.appThemeColor
                              : AppIconTheme.appIconThemeLight,
                          size: provider.selectedIndex == index ? 22.0 : 18.0,
                        ),
                      ),
                      AnimatedContainer(
                        width: size.width,
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.fastEaseInToSlowEaseOut,
                        transform: Matrix4.translationValues(0,
                            provider.selectedIndex == index ? 15.0 : 60.0, 0.0),
                        child: Text(item[index].label,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.h4TextStyle(
                                color: AppTheme.appThemeColor,
                                size: 12.0,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
