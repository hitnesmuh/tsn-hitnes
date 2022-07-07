import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tsn_technical_hitnes/models/keranjang_model.dart';
import 'package:tsn_technical_hitnes/services/keranjang_service.dart';

part 'keranjang_state.dart';

class KeranjangCubit extends Cubit<KeranjangState> {
  KeranjangCubit() : super(KeranjangInitial());

  void createKeranjang(KeranjangModel keranjang) async {
    try {
      emit(KeranjangLoading());
      await KeranjangService().createKeranjang(keranjang);
    } catch (e) {
      emit(KeranjangFailed(e.toString()));
    }
  }
}
