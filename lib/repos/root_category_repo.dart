import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/models/root_category.dart';
import 'package:online_shop/resources/firestore.dart';

class RootCategoryRepo {
  static final CollectionReference rootCategories = 
    firestore.collection('rootCategories');

  static Future<bool> isNameExist(String name, String id) async {
    final QuerySnapshot snapshot = 
      await rootCategories.where('name', isEqualTo: name).get();

    // when creating a root category the id will be null
    if(snapshot.docs.isNotEmpty && snapshot.docs.first.id != id) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> addRootCategory(RootCategory rootCategory) async {
    await rootCategories.add(rootCategory.map);
  }

  static Future<void> updateRootCategory(RootCategory rootCategory) async {
    await rootCategories.doc(rootCategory.id).update(rootCategory.map);
  }
}
