class UserModel {
  final String title;
  final String description;
  final String image;
  final double price;

  UserModel(
      {required this.price,
      required this.title,
      required this.description,
      required this.image});

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      title: jsonData['title'],
      description: jsonData['description'],
      image: jsonData['image'],
      price: jsonData['price'],
    );
  }
}
