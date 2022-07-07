import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final int price;
  final String imageUrl;

  ProductModel({
    required this.id,
    this.name = '',
    this.imageUrl = '',
    this.price = 0,
  });

  factory ProductModel.fromjson(String id, Map<String, dynamic> json) =>
      ProductModel(
        id: id,
        name: json['name'],
        price: json['price'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'imageUrl': imageUrl,
      };

  @override
  List<Object?> get props => [id, name, price, imageUrl];
}
