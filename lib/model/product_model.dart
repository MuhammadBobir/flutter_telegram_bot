class ProductModel {
  int id;
  String title;
  int price;
  int? count;

  ProductModel(
      {required this.id, required this.price, required this.title, this.count});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        price: json['price'],
        title: json['title'],
        count: json['count']);
  }
}

List<ProductModel> productFromModel(List list) {
  return List<ProductModel>.from(list.map((e) => ProductModel.fromJson(e)));
}
