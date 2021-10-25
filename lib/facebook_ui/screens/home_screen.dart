import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import 'package:newapp/facebook_ui/config/palette.dart';
import 'package:newapp/facebook_ui/data/data.dart';
import 'package:newapp/facebook_ui/models/models.dart';
import 'package:newapp/facebook_ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

// mobile
class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController? scrollController;

  const _HomeScreenMobile({
    Key? key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: scrollController, slivers: [
      SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          title: Text('facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              )),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print("search")),
            CircleButton(
                icon: Icons.facebook,
                iconSize: 30.0,
                onPressed: () => print("facebook")),
          ]),
      SliverToBoxAdapter(
          child: CreatePostContainer(
        currentUser: currentUser,
      )),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
        sliver: SliverToBoxAdapter(
            child: Room(
          onlineUsers: onlineUsers,
        )),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories)),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          final Post post = posts[index];
          return PostContainer(post: post);
        },
        childCount: posts.length,
      ))
    ]);
  }
}

// dektop
class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController? scrollController;

  const _HomeScreenDesktop({
    Key? key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(controller: scrollController, slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
              sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories)),
            ),
            SliverToBoxAdapter(
                child: CreatePostContainer(
              currentUser: currentUser,
            )),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                  child: Room(
                onlineUsers: onlineUsers,
              )),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ))
          ]),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ContactList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
