import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/circle_button.dart';
import 'package:facebook_ui_clone/widgets/custom_tab_bar.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.onTap,
      required this.currentUser,
      required this.selectedIndex,
      required this.icons});
  final Function(int) onTap;
  final User currentUser;
  final int selectedIndex;
  final List<IconData> icons;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4),
      ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Expanded(
          child: Text(
            'facebook',
            style: TextStyle(
              fontSize: 32.0,
              color: Palette.facebookBlue,
              letterSpacing: -1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          width: 600,
          child: CustomTabBar(
              icons: icons,
              index: selectedIndex,
              onTap: onTap,
              isBottomIndecator: true),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ProfileAvatar(
                imageUrl: currentUser.imageUrl,
                hasCircle: false,
                isOnline: false),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                currentUser.name,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            CircleButton(
                icon: const Icon(Icons.search), onpress: () {}, size: 30),
            CircleButton(
                icon: const Icon(MdiIcons.facebookMessenger),
                onpress: () {},
                size: 30),
          ],
        ))
      ]),
    );
  }
}
