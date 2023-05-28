import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui_clone/models/post_model.dart';
import 'package:facebook_ui_clone/widgets/profile_avatar.dart';
import 'package:facebook_ui_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      elevation: isDesktop ? 1 : 0,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: isDesktop ? 5 : 0),
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PostHeader(post: post),
            const SizedBox(
              height: 4,
            ),
            Text(post.caption),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: CachedNetworkImage(imageUrl: post.imageUrl!))
                : const SizedBox.shrink(),
            const SizedBox(
              height: 8,
            ),
            PostStatas(post: post),
          ],
        ),
      ),
    );
  }
}

class PostStatas extends StatelessWidget {
  const PostStatas({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 10,
              child: Icon(
                Icons.thumb_up,
                size: 10,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text('${post.likes}'),
            const Spacer(),
            Text('${post.comments} Comments'),
            const SizedBox(
              width: 15,
            ),
            Text('${post.shares} Shares'),
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PostButton(
                icon: const Icon(Icons.thumb_up_alt_outlined),
                label: const Text('Like'),
                onTap: () {},
              ),
              PostButton(
                icon: const Icon(Icons.comment_outlined),
                label: const Text('Comment'),
                onTap: () {},
              ),
              PostButton(
                icon: const Icon(Icons.share_outlined),
                label: const Text('Share'),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  const PostButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});
  final Icon icon;
  final Text label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            const SizedBox(
              width: 4,
            ),
            label,
          ],
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.user.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${post.timeAgo} .'),
                Icon(
                  Icons.public,
                  size: 15,
                  color: Colors.grey[400],
                )
              ],
            )
          ],
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
      ],
    );
  }
}
