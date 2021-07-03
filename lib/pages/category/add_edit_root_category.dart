import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/pages/category/controllers/'
  'add_edit_root_category_controller.dart';
import 'package:online_shop/styles/paddings.dart';
import 'package:online_shop/widgets/button.dart';
import 'package:online_shop/widgets/form_text_field.dart';
import 'package:online_shop/widgets/get_snackbar.dart';
import 'package:online_shop/widgets/horizontal_box.dart';
import 'package:online_shop/widgets/vertical_box.dart';
import 'package:image_picker/image_picker.dart';

class AddEditRootCategory extends StatelessWidget {
  final AddEditRootCategoryController controller = 
    AddEditRootCategoryController(Get.arguments);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getAppBarTitle(),
      ),
      body: Obx(() {
        if(controller.state.value == ControllerState.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Form(
            key: formKey,
            child: ListView(
              padding: Paddings.pagePadding,
              children: <Widget>[
                // category name field
                getCategoryNameField(),
                VerticalBox(20),

                // image picker buttons
                getImagePickerButtons(),
                VerticalBox(20),

                // category image
                getCategoryImage(),

                // form submit button
                getFormSubmitButton(),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget getAppBarTitle() {
    final String appBarTitlePrefix = 
      controller.rootCategory.id == null ? 'Add' : 'Edit';
    
    return Text('$appBarTitlePrefix Root Category');
  }

  Widget getCategoryNameField() {
    return FormTextField(
      label: 'Root Category Name',
      initialValue: controller.rootCategory.name,
      validator: (String value) {
        if(value.trim().isEmpty) {
          return 'Category name is required.';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        controller.rootCategory.name = value.trim();
      },
    );
  }

  Widget getImagePickerButtons() {
    final ImagePicker imagePicker = ImagePicker();

    return Row(
      children: <Widget>[
        // prefix text
        Expanded(
          child: Text('Pick an image from:'),
        ),
        HorizontalBox(10),
        
        // gallery button
        Button(
          icon: Icons.storage,
          text: 'Gallery',
          onPressed: () async {
            controller.pickedFile.value = await imagePicker.getImage(
              source: ImageSource.gallery,
              imageQuality: 50,
            ) ?? PickedFile('');
          },
        ),
        HorizontalBox(10),
        
        // camera button
        Button(
          icon: Icons.camera,
          text: 'Camera',
          onPressed: () async {
            controller.pickedFile.value = await imagePicker.getImage(
              source: ImageSource.camera,
              imageQuality: 50,
            ) ?? PickedFile('');
          },
        ),
      ],
    );
  }

  Widget getCategoryImage() {
    return Obx(() {
      if(controller.pickedFile.value.path.isNotEmpty) {
        return Column(
          children: <Widget>[
            Image.file(
              File(controller.pickedFile.value.path),
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            VerticalBox(20),
          ],
        );
      } else if(controller.rootCategory.imageUrl != null) {
        return Column(
          children: <Widget>[
            Image.network(
              controller.rootCategory.imageUrl,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            VerticalBox(20),
          ],
        );
      } else {
        // returning this because this function can't return null
        return VerticalBox(0);
      }
    });
  }

  Widget getFormSubmitButton() {
    final String buttonTextPrefix = 
      controller.rootCategory.id == null ? 'Add' : 'Update';
    
    return Button(
      icon: Icons.add_circle,
      text: '$buttonTextPrefix Root Category',
      onPressed: () async {
        if(formKey.currentState.validate()) {
          if(controller.rootCategory.imageUrl == null && 
              controller.pickedFile.value.path.isEmpty) {
            getSnackbar(
              'Image Required',
              'Pick a root category image.',
            );
          } else {
            formKey.currentState.save();
            await controller.addUpdateRootCategory();

            final ControllerState state = controller.state.value;

            if(state == ControllerState.added) {
              getSnackbar(
                'Added',
                'Root Category added successfully.',
              );
            } else if(state == ControllerState.updated) {
              getSnackbar(
                'Updated',
                'Root Category updated successfully.',
              );
            } else if(state == ControllerState.duplicate) {
              getSnackbar(
                'Duplicate',
                'Root Category name alrady exist.',
              );
            } else if(state == ControllerState.failed) {
              getSnackbar(
                'Failed',
                'Operation failed, please try again.',
              );
            }
          }
        }
      },
    );
  }
}
