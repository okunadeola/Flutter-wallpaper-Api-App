import 'package:flutter/material.dart';

import 'package:newapp/facebook_ui/config/palette.dart';
import 'package:newapp/facebook_ui/models/models.dart';
import 'package:newapp/facebook_ui/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  final Post? post;
  const PostContainer({
    Key? key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
          vertical: 5.0, horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _PostHeader(post: post),
                    const SizedBox(height: 4.0),
                    Text(post!.caption!),
                    post!.imageUrl != null
                        ? const SizedBox.shrink()
                        : const SizedBox(
                            height: 6.0,
                          )
                  ],
                ),
              ),
              post!.imageUrl != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.network(post!.imageUrl!),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: _PostStats(post: post),
              )
            ],
          )),
    );
  }
}

// header
class _PostHeader extends StatelessWidget {
  final Post? post;
  const _PostHeader({
    Key? key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post!.user!.imageUrl!),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post!.user!.name!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post!.timeAgo!} >',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
        )
      ],
    );
  }
}

// stat

class _PostStats extends StatelessWidget {
  final Post? post;
  const _PostStats({
    Key? key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Text(
                '${post!.likes!}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${post!.comments!} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              '${post!.shares!} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButon(
                icon: Icon(Icons.thumb_up_outlined,
                    color: Colors.grey[600], size: 20.0),
                label: "Like",
                onTap: () {}),
            _PostButon(
                icon: Icon(Icons.comment_outlined,
                    color: Colors.grey[600], size: 20.0),
                label: "Comment",
                onTap: () {}),
            _PostButon(
                icon: Icon(Icons.share_outlined,
                    color: Colors.grey[600], size: 20.0),
                label: "Share",
                onTap: () {}),
          ],
        )
      ],
    );
  }
}

// _PostButon

class _PostButon extends StatelessWidget {
  final Icon? icon;
  final String? label;
  final VoidCallback? onTap;

  const _PostButon({
    Key? key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon!, const SizedBox(width: 4.0), Text(label!)],
            ),
          ),
        ),
      ),
    );
  }
}
