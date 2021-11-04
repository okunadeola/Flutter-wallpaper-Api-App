import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newapp/wallpaperApp/data/data.dart';
import 'package:newapp/wallpaperApp/models/models.dart';
import 'package:newapp/wallpaperApp/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String? searchQuery;

  const Search({
    Key? key,
    @required this.searchQuery,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  List<WallpaperModel>? wallpapers = [];

  getTrendingWallpaper(String query) async {
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
    getTrendingWallpaper(widget.searchQuery ?? '');
    super.initState();
    // searchController.text = widget.searchQuery ?? "";
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
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff5f8fd),
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              hintText: "Search wallpaper",
                              border: InputBorder.none),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            getTrendingWallpaper(searchController.text);
                            // Search(
                            // searchQuery: searchController.text,
                            // );
                          },
                          child: Container(child: Icon(Icons.search)))
                    ],
                  ),
                ),
                SizedBox(height: 16),
                wallpapersList(wallpapers: wallpapers, context: context)
              ],
            ),
          ),
        ));
  }
}
