import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tsn_technical_hitnes/models/product_model.dart';
import 'package:tsn_technical_hitnes/services/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void fetchProducts() async {
    try {
      emit(ProductLoading());

      List<ProductModel> products = await ProductService().fecthProducts();

      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductFailed(e.toString()));
    }
  }
}
