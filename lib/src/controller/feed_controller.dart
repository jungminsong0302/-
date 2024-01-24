import 'package:carrot_flutter/src/model/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import '../connect/feed_connect.dart';

// 서버 통신이 완성되면 해당 부분 활성화 필요
// final feedConnect = Get.put(FeedConnect());

class FeedController extends GetxController {
  List<FeedModel> list = [];

  feedIndex({int page = 1}) async {
    // 서버 통신이 완성되면 해당 부분 활성화 필요
    /* List jsonData = await feedConnect.getList(page);
    if (page == 1) {
      list.clear();
    }
    List<FeedModel> tmp = jsonData.map((m) => FeedModel.parse(m)).toList();
    list.addAll(tmp);
    update(); */
  }

  Future<bool> feedCreate(
      String title, String content, String price, int? imageId) async {
    try {
      // 서버 통신이 완성되면 해당 부분 활성화 필요
      /* await feedConnect.storeItem(title, price, content, imageId: imageId);
      await feedIndex(); */
      return true;
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
      return false;
    }
  }

  Future<int> upload(String name, String path) async {
    // 서버 통신이 완성되면 해당 부분 활성화 필요
    /* Map data = await feedConnect.imageUpload(name, path);
    return data['id']; */
    return 0; // 임시로 0을 반환
  }
}
