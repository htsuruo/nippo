class UserModel {
  int _id;
  String _displayName;
  String _imageUrl;

  UserModel(Map<String, dynamic> json) {
    _id = json['id'];
    _displayName = json['displayName'];
    _imageUrl = json['image_url'];
  }

  int get id => _id;
  String get imageUrl => _imageUrl;
}
