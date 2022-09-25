import 'package:flutter/material.dart';
import 'package:flutter_practice/theme_custom.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  Utils._();

  static Future<XFile?> selectImage() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  static Future<CroppedFile?> cropSelectedImage(String filePath) async {
    return await ImageCropper().cropImage(sourcePath: filePath,
        //aspectRatio: const CropAspectRatio(ratioX: 1.5, ratioY: 1.0),
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ], uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cortar Imagen',
          toolbarColor: ColorCustom.marineBlue,
          backgroundColor: ColorCustom.marineBlue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
    ]);
  }

  static void showSnackbar() {
    Get.snackbar(
      'Producto Agregado',
      'El producto ha sido agregado correctamente',
      margin: const EdgeInsets.all(16.0),
      colorText: ColorCustom.whiteColor,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorCustom.marineBlue.withOpacity(0.5),
      borderRadius: 16.0,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInOutBack,
      icon: const Icon(
        Icons.check_circle_outline_rounded,
        size: 30,
        color: Colors.greenAccent,
      ),
    );
  }
}
