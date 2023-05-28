import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Text(
              'Contacts',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            )),
            Icon(
              Icons.search,
              color: Colors.grey[600],
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(
              Icons.more_horiz,
              color: Colors.grey[600],
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              final User user = users[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    ProfileAvatar(
                        imageUrl: user.imageUrl,
                        hasCircle: false,
                        isOnline: false),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Flexible(
                        child: Text(
                          user.name,
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
