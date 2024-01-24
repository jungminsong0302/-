import 'package:carrot_flutter/src/controller/feed_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/feed_list_item.dart';

final feedController = Get.put(FeedController());

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
  int page = 1;

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  Future<void> _onRefresh() async {
    page = 1;
    await feedController.feedIndex();
  }

  bool _onNotification(ScrollNotification scrollInfo) {
    if (scrollInfo is ScrollEndNotification &&
        scrollInfo.metrics.extentAfter == 0) {
      feedController.feedIndex(page: ++page);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(builder: (controller) {
      return NotificationListener<ScrollNotification>(
        onNotification: _onNotification,
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return FeedListItem(controller.list[index]);
            },
          ),
        ),
      );
    });
  }
}
