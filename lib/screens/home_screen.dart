import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/data/data.dart';
import 'package:facebook_ui_clone/models/user_model.dart';
import 'package:facebook_ui_clone/widgets/circle_button.dart';
import 'package:facebook_ui_clone/widgets/create_post_container.dart';
import 'package:facebook_ui_clone/widgets/rooms.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          floating: true,
          title: Text(
            'facebook',
            style: TextStyle(
              fontSize: 28.0,
              color: Palette.facebookBlue,
              letterSpacing: -1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CircleButton(
                icon: Icon(Icons.search),
                onpress: () {
                  print('search');
                },
                size: 30),
            CircleButton(
                icon: Icon(MdiIcons.facebookMessenger),
                onpress: () {
                  print('message');
                },
                size: 30)
          ],
        ),
        SliverToBoxAdapter(
            child: CreatePostContainer(
          currentUser: currentUser,
        )),
        SliverPadding(
          padding: EdgeInsets.only(top: 10),
          sliver: SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers)),
        )
      ]),
    );
  }
}
