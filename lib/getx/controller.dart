import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Controller extends GetxController {
  File? image;
  int addInfoSelected = 0;
  String add_selected = "";
  bool like_btn = false;
  int onchange = 0;
  RxInt selectedScreen = 0.obs;
  RxInt onBoardingOnChange = 0.obs;
  // List likeList = [];
  RxBool signUpLoader = false.obs;
  RxBool signInpLoader = false.obs;
  RxInt logInCheck = 0.obs;
  RxBool likeSelected = false.obs;

  PageView(int value) {
    onchange = value;
    update();
  }

  AddInfo(int value) {
    addInfoSelected = value;

    update();
  }

  AddInfoWork(String value) {
    addInfoSelected = value as int;

    update();
  }

  ImagePicker picker = ImagePicker();
  PickImage(ImageSource imageSource) async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      image = File(file.path);
      update();
    }
    update();
  }

  // void signuoloder(bool value) {
  //   signuploder = value;
  //   update();
  // }

  // setLikeList(int id) {
  //   if (likeList.contains(id)) {
  //     likeList.remove(id);
  //   } else {
  //     likeList.add(id);
  //   }
  //   update();
  // }
}
