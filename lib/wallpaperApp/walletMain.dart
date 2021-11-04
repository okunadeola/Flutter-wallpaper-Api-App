import  'package:flutter/material.dart';
import 'package:newapp/wallpaperApp/views/views.dart';


class WallpaperApp extends StatelessWidget {
  const  WallpaperApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WallpaperHub",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHome(),
    );
  }
}