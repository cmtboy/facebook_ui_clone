import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/create_room_button.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:facebook_ui_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  const Rooms({super.key, required this.onlineUsers});
  final List<User> onlineUsers;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      elevation: isDesktop ? 1 : 0,
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5 : 0),
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        color: Colors.white,
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: CreateRoomButton(onpress: () {}),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(left: 8, top: 10, bottom: 7),
              child: ProfileAvatar(
                imageUrl: onlineUsers[index - 1].imageUrl,
                isOnline: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
