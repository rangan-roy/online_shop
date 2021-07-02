const String NAME_KEY = 'name';
const String IMAGE_KEY = 'image';

class RootCategory {
  String id;
  String name;
  String image;

  RootCategory({
    this.id,
    this.name,
    this.image,
  });

  RootCategory.fromMap(Map<String, dynamic> map, String id) {
    this.id = id;
    name = map[NAME_KEY];
    image = map[IMAGE_KEY];
  }

  Map<String, dynamic> get map => {
    NAME_KEY: name,
    IMAGE_KEY: image,
  };
}
