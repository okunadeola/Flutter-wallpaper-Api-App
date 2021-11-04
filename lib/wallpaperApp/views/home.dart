import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newapp/wallpaperApp/data/data.dart';
import 'package:newapp/wallpaperApp/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/wallpaperApp/views/categories.dart';
// import 'package:newapp/walletApp/views/image_view.dart';
import 'package:newapp/wallpaperApp/views/search.dart';
import 'package:newapp/wallpaperApp/widgets/widget.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}


class _MyHomeState extends State<MyHome> {
  List<CategoriesModel>? categories = [];
  List<WallpaperModel>? wallpapers = [];
  TextEditingController searchController = TextEditingController();

  var url = Uri.parse("https://api.pexels.com/v1/curated?per_page=15&page=1");

  getTrendingWallpaper() async {
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
    categories = getcategories();
    getTrendingWallpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                margin: EdgeInsets.symmetric(horizontal: 24.0),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search(
                                        searchQuery: searchController.text,
                                      )));
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 80,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: categories?.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoriesTile(
                        imgUrl: categories?[index].imgUrl,
                        title: categories?[index].categoriesName,
                      );
                    }),
              ),
              wallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String? imgUrl, title;

  const CategoriesTile({
    Key? key,
    @required this.imgUrl,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categories(
                      categoriesName: title?.toLowerCase(),
                    )));
      },
      child: Container(
          margin: const EdgeInsets.only(right: 4),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgUrl!,
                    height: 50,
                    width: 100,
                    fit: BoxFit.cover,
                  )),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  child: Text(
                    title!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )),
            ],
          )),
    );
  }
}
