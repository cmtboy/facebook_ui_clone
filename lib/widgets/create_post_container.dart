import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:facebook_ui_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({super.key, required this.currentUser});

  final User currentUser;

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
        child: Column(children: [
          Row(children: [
            Padding(
                padding: const EdgeInsets.all(12),
                child: ProfileAvatar(
                  imageUrl: currentUser.imageUrl,
                )),
            const Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind? '),
              ),
            )
          ]),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                label: const Text('Live'),
                onPressed: () {},
                icon: const Icon(
                  Icons.videocam,
                  color: Colors.red,
                ),
              ),
              const VerticalDivider(width: 6),
              TextButton.icon(
                label: const Text('Photo'),
                onPressed: () {},
                icon: const Icon(
                  Icons.photo_library,
                  color: Colors.green,
                ),
              ),
              const VerticalDivider(width: 6),
              TextButton.icon(
                label: const Text('Room'),
                onPressed: () {},
                icon: const Icon(
                  Icons.video_call,
                  color: Colors.purpleAccent,
                ),
              ),
              const VerticalDivider(width: 6),
            ],
          )
        ]),
      ),
    );
  }
}
