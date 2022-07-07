import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String noHp;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.noHp,
  });

  @override
  List<Object?> get props => [id, email, name, noHp];
}
