import 'package:flutter/material.dart';
import 'package:newapp/facebook_ui/config/palette.dart';

import 'package:newapp/facebook_ui/models/models.dart';
import 'package:newapp/facebook_ui/widgets/widgets.dart';

class Room extends StatelessWidget {
  final List<User>? onlineUsers;
  const Room({
    Key? key,
    @required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers!.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButtton(),
              );
            }
            final User user = onlineUsers![index - 1];

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: ProfileAvatar(
                imageUrl: user.imageUrl ?? "",
                isActive: true,
              ),
            );
          }),
    );
  }
}

class _CreateRoomButtton extends StatelessWidget {
  const _CreateRoomButtton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30.0),
          // border: Border.all(width: 1.0, color: Colors.blueAccent
          // )
        ),
        child: Row(
          children: [
            ShaderMask(
              shaderCallback: (rect) =>
                  Palette.createRoomGradient.createShader(rect),
              child: Icon(
                Icons.video_call,
                size: 35.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Text('Create\nRoom'),
          ],
        ),
      ),
    );
  }
}


// OutlinedButton(
//         onPressed: () {},
//         child: Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.horizontal(),
//           ),
//         ));
