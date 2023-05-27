import 'package:facebook_ui_clone/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {super.key,
      required this.icons,
      required this.index,
      required this.onTap,
      required this.isBottomIndecator});
  final List<IconData> icons;
  final int index;
  final Function(int) onTap;
  final bool isBottomIndecator;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: isBottomIndecator
              ? Border(
                  bottom: BorderSide(color: Palette.facebookBlue, width: 3),
                )
              : Border(
                  top: BorderSide(color: Palette.facebookBlue, width: 3),
                )),
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color: i == index ? Palette.facebookBlue : Colors.black45,
                  size: 30,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
