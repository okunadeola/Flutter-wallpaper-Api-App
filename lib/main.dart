import 'dart:io';
import 'dart:typed_data';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:newapp/walletApp/walletMain.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:newapp/assignments/listCard.dart';
import 'package:newapp/facebook_ui/facebookMain.dart';


void main() {
  // runApp(Facebook());
  // runApp(WallpaperApp());
  runApp(ListCard());
}














// flutter class
// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String name = 'Taiwo';

//   void displayHello() {
//     setState(() {
//       this.name = "kenny";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: ScreenShots());
//   }
// }










// screen shot component
// class ScreenShots extends StatefulWidget {
//   const ScreenShots({Key? key}) : super(key: key);

//   @override
//   _ScreenShotsState createState() => _ScreenShotsState();
// }

// class _ScreenShotsState extends State<ScreenShots> {
//   ScreenshotController controller = ScreenshotController();

//   @override
//   Widget build(BuildContext context) {
//     return Screenshot(
//       controller: controller,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Take Screenshot'),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             Container(width: 200, height: 200, child: buildImage()),
//             const SizedBox(height: 32),
//             ButtonWidget(
//               text: 'Capture Screen',
//               onClicked: () async {
//                 final image = await controller.capture();
//                 if (image == null) return;
//                 await saveImage(image);
//               },
//             ),
//             const SizedBox(height: 32),
//             ButtonWidget(
//               text: 'Capture Widget',
//               onClicked: () async {
//                 final image = await controller.captureFromWidget(buildImage());
//                 saveAndShare(image);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future saveAndShare(Uint8List bytes) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final image = File('${directory.path}/flutter.png');
//     image.writeAsBytesSync(bytes);
//     await Share.shareFiles([image.path]);
//   }

//   Future<String> saveImage(Uint8List bytes) async {
//     await [Permission.storage].request();

//     final time = DateTime.now()
//         .toIso8601String()
//         .replaceAll('.', '-')
//         .replaceAll(':', '-');
//     final name = 'screenshot_$time';
//     final result = await ImageGallerySaver.saveImage(bytes, name: name);

//     return result['filePath'];
//   }

//   Widget buildImage() => Stack(
//         children: [
//           AspectRatio(
//             aspectRatio: 1,
//             child: Image.network(
//               "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             bottom: 16,
//             right: 0,
//             left: 0,
//             child: Center(
//                 child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//               color: Colors.black,
//               child: Text(
//                 'Summer',
//                 style: TextStyle(color: Colors.white, fontSize: 32),
//               ),
//             )),
//           )
//         ],
//       );
// }

// class ButtonWidget extends StatelessWidget {
//   final String? text;
//   final VoidCallback? onClicked;

//   const ButtonWidget({
//     Key? key,
//     @required this.text,
//     @required this.onClicked,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: TextButton.icon(
//             onPressed: onClicked, icon: Icon(Icons.save), label: Text('save')));
//   }
// }
