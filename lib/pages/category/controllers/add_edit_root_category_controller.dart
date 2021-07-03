import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_shop/models/root_category.dart';
import 'package:online_shop/repos/root_category_repo.dart';
import 'package:online_shop/repos/storage_repo.dart';

enum ControllerState {
  initital,
  loading,
  added,
  updated,
  duplicate,
  failed,
}

class AddEditRootCategoryController {
  RootCategory rootCategory;
  final Rx<PickedFile> pickedFile = PickedFile('').obs;
  final Rx<ControllerState> state = ControllerState.initital.obs;

  AddEditRootCategoryController(this.rootCategory);

  Future<void> addUpdateRootCategory() async {
    state.value = ControllerState.loading;
    
    try {
      final bool isNameExist = 
        await RootCategoryRepo.isNameExist(rootCategory.name, rootCategory.id);
      
      if(isNameExist == false) {
        // check if a new image is picked
        if(pickedFile.value.path.isNotEmpty) {
          // delete the old image if any
          if(rootCategory.imageUrl != null) {
            await StorageRepo.deleteFile(rootCategory.imageUrl);
          }

          // upload the new image
          rootCategory.imageUrl = await StorageRepo.saveFile(
            pickedFile.value.path,
            'root-category-images',
          );
          
          // remove the picked file path to avoid reupload on add/edit retry and
          // to show no image after successfull add operation
          pickedFile.value = PickedFile('');
        }

        if(rootCategory.id == null) {
          await RootCategoryRepo.addRootCategory(rootCategory);
          rootCategory = RootCategory();
          state.value = ControllerState.added;
        } else {
          await RootCategoryRepo.updateRootCategory(rootCategory);
          state.value = ControllerState.updated;
        }
      } else {
        state.value = ControllerState.duplicate;
      }
    } catch(error) {
      state.value = ControllerState.failed;
    }
  }
}
