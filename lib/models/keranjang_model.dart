import 'package:equatable/equatable.dart';
import 'package:tsn_technical_hitnes/models/product_model.dart';

class KeranjangModel extends Equatable {
  final ProductModel product;
  final String selectedSize;
  final int price;

  KeranjangModel({
    required this.product,
    this.price = 0,
    this.selectedSize = '',
  });

  @override
  List<Object?> get props => [product, selectedSize, price];
}
