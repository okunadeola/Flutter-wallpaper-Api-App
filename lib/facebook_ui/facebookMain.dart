import 'package:flutter/material.dart';
import 'package:newapp/facebook_ui/config/palette.dart';
import 'package:newapp/facebook_ui/screens/screens.dart';

class Facebook extends StatelessWidget {
  const Facebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Palette.scaffold),
      home: NavigationScreen(),
    );
  }
}
