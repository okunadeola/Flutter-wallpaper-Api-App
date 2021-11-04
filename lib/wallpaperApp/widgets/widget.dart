import 'package:flutter/material.dart';
import 'package:newapp/wallpaperApp/models/models.dart';
import 'package:newapp/wallpaperApp/views/image_view.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          children: const <TextSpan>[
            TextSpan(
                text: 'Wallpaper', style: TextStyle(color: Colors.black87)),
            TextSpan(text: 'Hub', style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    ],
  );

  //  Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //   Text("Wallpaper", style: const TextStyle(color: Colors.black87),),
  //   Text("Hub", style: const TextStyle(color: Colors.blue))
  // ],);
  //  Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: <Widget>[
  //     Text(
  //       "Wallpaper",
  //       style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
  //     ),
  //     Text(
  //       "Hub",
  //       style: TextStyle(color: Colors.blue, fontFamily: 'Overpass'),
  //     )
  //   ],
  // );
}



Widget wallpapersList({List<WallpaperModel>? wallpapers, context}) {
  return wallpapers?.length == 0 ? Center(child: CircularProgressIndicator()): Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child:  GridView.count(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: wallpapers!.map((wallpaper) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ImageView(imgUrl: wallpaper.src!.portrait!)));
            },
            child: Hero(
              tag: wallpaper.src!.portrait!,
              child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        wallpaper.src!.portrait!,
                        fit: BoxFit.cover,
                      ))),
            ),
          ));
        }).toList(),
      ));
}
