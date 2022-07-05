import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String noHp;

  User({
    required this.id,
    this.name = '',
    required this.email,
    required this.noHp,
  });

  @override
  List<Object?> get props => [id, email, name, noHp];
}
