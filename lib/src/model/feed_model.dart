class FeedModel {
  int? id;
  String? title;
  int? price;
  String? content;
  DateTime? createdAt;
  int? userId;
  int? imageId;
  FeedModel.parse(Map m) {
    id = m['id'];
    title = m['title'];
    price = m['price'];
    content = m['content'];
    createdAt = DateTime.parse(m['created_at']);
    userId = m['user_id'];
    imageId = m['image_id'];
  }
}
