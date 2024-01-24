class UserModel {
  int? id;
  String? email;
  String? name;
  
  UserModel.fromJson(Map m) {
    id = m['id'];
    email = m['email'];
    name = m['email'];
  }
}
