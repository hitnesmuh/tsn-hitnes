import 'package:firebase_auth/firebase_auth.dart';
import 'package:tsn_technical_hitnes/models/user_model.dart';
import 'package:tsn_technical_hitnes/services/user_service.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUp(
      {required String email,
      required String name,
      required String password,
      required String noHp}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        noHp: noHp,
      );

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }
}
