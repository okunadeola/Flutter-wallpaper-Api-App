import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:newapp/facebook_ui/config/palette.dart';
import 'package:newapp/facebook_ui/data/data.dart';
import 'package:newapp/facebook_ui/models/models.dart';
import 'package:newapp/facebook_ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
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
          delegate: SliverChildBuilderDelegate((context, index){
            final Post post = posts[index];
            return PostContainer(post:post);

          },
          childCount: posts.length,
          )
         
        )
      ]),
    );
  }
}
