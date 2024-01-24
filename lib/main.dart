import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/app.dart';
import 'src/controller/user_controller.dart';

void main() async {
  // GetStorage 사용을 위한 초기화
  await GetStorage.init();

  //로그인 여부 체크
  final userController = Get.put(UserController());
  bool isLogin = await userController.isLogin();

  runApp(MyApp(isLogin));
}