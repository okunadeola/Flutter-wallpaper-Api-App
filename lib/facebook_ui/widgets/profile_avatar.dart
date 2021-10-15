import 'package:flutter/material.dart';
import 'package:newapp/facebook_ui/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;
  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.hasBorder = false,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
              radius: hasBorder? 18.0 : 20.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(imageUrl)),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.online,
                      border: Border.all(width: 2.0, color: Colors.white)),
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}
