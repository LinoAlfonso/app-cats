import '../../domain/domain.dart';

class ImageCatMapper {
  static ImageCat jsonToEntity(Map<String, dynamic> json) {
    return ImageCat(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
    );
  }
}