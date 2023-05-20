import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({super.key, required this.currentUser});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Row(children: [
          Padding(
              padding: const EdgeInsets.all(12),
              child: ProfileAvatar(
                imageUrl: currentUser.imageUrl,
              )),
          Expanded(
            child: TextField(
              decoration:
                  InputDecoration.collapsed(hintText: 'What\'s on your mind? '),
            ),
          )
        ]),
        Divider(
          height: 10,
          thickness: 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              label: Text('Live'),
              onPressed: () {},
              icon: Icon(
                Icons.videocam,
                color: Colors.red,
              ),
            ),
            VerticalDivider(width: 6),
            TextButton.icon(
              label: Text('Photo'),
              onPressed: () {},
              icon: Icon(
                Icons.photo_library,
                color: Colors.green,
              ),
            ),
            VerticalDivider(width: 6),
            TextButton.icon(
              label: Text('Room'),
              onPressed: () {},
              icon: Icon(
                Icons.video_call,
                color: Colors.purpleAccent,
              ),
            ),
            VerticalDivider(width: 6),
          ],
        )
      ]),
    );
  }
}
