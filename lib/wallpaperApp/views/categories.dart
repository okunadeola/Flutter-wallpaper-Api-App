import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:newapp/wallpaperApp/data/data.dart';
import 'package:newapp/wallpaperApp/models/models.dart';
import 'package:newapp/wallpaperApp/widgets/widget.dart';

class Categories extends StatefulWidget {
  final String? categoriesName;

  const Categories({
    Key? key,
    @required this.categoriesName,
  }) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<WallpaperModel>? wallpapers = [];

  getSearchWallpaper(String query) async {
    var url = Uri.parse(
        "https://api.pexels.com/v1/search?query=$query&per_page=15&page=1");
    var response =
        await http.get(url, headers: {"Authorization": apiKey ?? ''});

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers?.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpaper(widget.categoriesName ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 16),
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
