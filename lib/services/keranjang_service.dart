import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsn_technical_hitnes/models/keranjang_model.dart';

class KeranjangService {
  CollectionReference _keranjangReference =
      FirebaseFirestore.instance.collection('keranjangs');

  Future<void> createKeranjang(KeranjangModel keranjang) async {
    try {
      _keranjangReference.add({
        'product': keranjang.product.toJson(),
        'selectedSize': keranjang.selectedSize,
      });
    } catch (e) {
      throw e;
    }
  }
}
