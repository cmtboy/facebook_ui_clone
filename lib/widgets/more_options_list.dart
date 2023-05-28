import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  const MoreOptionsList({super.key, required this.currentUser});

  final User currentUser;

  final List<List> moreOptionsList = const [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Event']
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: ListView.builder(
        itemCount: moreOptionsList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
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
                    child: Flexible(
                      child: Text(
                        currentUser.name,
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          final List option = moreOptionsList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Options(icon: option[0], color: option[1], label: option[2]),
          );
        },
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options(
      {super.key,
      required this.icon,
      required this.label,
      required this.color});
  final IconData icon;
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(children: [
        Icon(
          icon,
          color: color,
          size: 38,
        ),
        const SizedBox(
          width: 6,
        ),
        Flexible(
            child: Text(
          label,
          style: const TextStyle(fontSize: 16),
          overflow: TextOverflow.ellipsis,
        ))
      ]),
    );
  }
}
