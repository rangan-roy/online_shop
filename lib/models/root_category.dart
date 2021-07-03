const String NAME_KEY = 'name';
const String IMAGE_URL_KEY = 'imageUrl';

class RootCategory {
  String id;
  String name;
  String imageUrl;

  RootCategory({
    this.id,
    this.name,
    this.imageUrl,
  });

  RootCategory.fromMap(Map<String, dynamic> map, String id) {
    this.id = id;
    name = map[NAME_KEY];
    imageUrl = map[IMAGE_URL_KEY];
  }

  Map<String, dynamic> get map => {
    NAME_KEY: name,
    IMAGE_URL_KEY: imageUrl,
  };
}
