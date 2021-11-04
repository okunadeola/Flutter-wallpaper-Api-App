class WallpaperModel {

 String ? photographer;
 String ? photographer_url;
 int ? photographer_id;
SrcModel ? src;

  WallpaperModel({
   this.photographer,
   this.photographer_url,
   this.photographer_id,
   this.src
  });

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData){
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData['src']),
      photographer_url: jsonData['photographer_url'],
      photographer_id: jsonData["photographer_id"],
      photographer: jsonData["photographer"],
    );
  }

}



class SrcModel {
  String ? origin;
  String ? small;
  String ? portrait;
  SrcModel({
    this.origin,
    this.small,
    this.portrait,
  });

  factory SrcModel.fromMap(Map<String, dynamic> jsonData){
    return SrcModel(
      origin:jsonData["origin"],
      portrait:jsonData["portrait"],
      small:jsonData["small"],
    
     );
  }
}
