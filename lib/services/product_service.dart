import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsn_technical_hitnes/models/product_model.dart';

class ProductService {
  CollectionReference _productRef =
      FirebaseFirestore.instance.collection('products');

  Future<List<ProductModel>> fecthProducts() async {
    try {
      QuerySnapshot result = await _productRef.get();

      List<ProductModel> products = result.docs.map(
        (e) {
          return ProductModel.fromjson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return products;
    } catch (e) {
      throw e;
    }
  }
}
