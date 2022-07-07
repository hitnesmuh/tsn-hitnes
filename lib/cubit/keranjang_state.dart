part of 'keranjang_cubit.dart';

abstract class KeranjangState extends Equatable {
  const KeranjangState();

  @override
  List<Object> get props => [];
}

class KeranjangInitial extends KeranjangState {}

class KeranjangLoading extends KeranjangState {}

class KeranjangFailed extends KeranjangState {
  final String error;

  KeranjangFailed(this.error);

  @override
  List<Object> get props => [error];
}

class KeranjangSuccess extends KeranjangState {
  final List<KeranjangModel> keranjangs;

  KeranjangSuccess(this.keranjangs);

  @override
  List<Object> get props => keranjangs;
}
