import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/data/data.dart';
import 'package:facebook_ui_clone/models/post_model.dart';
import 'package:facebook_ui_clone/widgets/circle_button.dart';
import 'package:facebook_ui_clone/widgets/contact_list.dart';
import 'package:facebook_ui_clone/widgets/create_post_container.dart';
import 'package:facebook_ui_clone/widgets/more_options_list.dart';
import 'package:facebook_ui_clone/widgets/post_container.dart';
import 'package:facebook_ui_clone/widgets/responsive.dart';
import 'package:facebook_ui_clone/widgets/rooms.dart';
import 'package:facebook_ui_clone/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TrackingScrollController scrollController = TrackingScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Responsive(
              mobile: MobileView(scrollController: scrollController),
              desktop: DesktopView(scrollController: scrollController))),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key, required this.scrollController});
  final TrackingScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: scrollController, slivers: [
      SliverAppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        floating: true,
        title: const Text(
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
              icon: const Icon(Icons.search), onpress: () {}, size: 30),
          CircleButton(
              icon: const Icon(MdiIcons.facebookMessenger),
              onpress: () {},
              size: 30)
        ],
      ),
      const SliverToBoxAdapter(
          child: CreatePostContainer(
        currentUser: currentUser,
      )),
      const SliverPadding(
        padding: EdgeInsets.only(top: 10),
        sliver: SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers)),
      ),
      SliverPadding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories)),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        Post post = posts[index];
        return PostContainer(post: post);
      }, childCount: posts.length))
    ]);
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({super.key, required this.scrollController});
  final TrackingScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 600,
          child: CustomScrollView(controller: scrollController, slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories)),
            ),
            const SliverToBoxAdapter(
                child: CreatePostContainer(
              currentUser: currentUser,
            )),
            const SliverPadding(
              padding: EdgeInsets.only(top: 10),
              sliver:
                  SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers)),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              Post post = posts[index];
              return PostContainer(post: post);
            }, childCount: posts.length))
          ]),
        ),
        const Spacer(),
        const Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ContactList(users: onlineUsers),
            ),
          ),
        )
      ],
    );
  }
}
