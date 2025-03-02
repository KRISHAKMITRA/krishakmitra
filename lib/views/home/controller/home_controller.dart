import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:krishak/funs/auth/auth.dart';
import 'package:krishak/funs/fire/user.dart';
import 'package:krishak/main.dart';

class HomeController extends GetxController {
  ///
  final userBox = Hive.box(Env.user);
  UserFire userFire = UserFire();

  RxBool get isLogin => (userBox.get("uid") != null).obs;

  String get userImage => userBox.get("image", defaultValue: "");

  ///
  @override
  void onInit() {
    print("objec>>>>>>>>>>><<<<t");
    // googleSignIn();
    super.onInit();
  }

  final AuthService _authService = AuthService();

  googleSignIn() async {
    if (isLogin.value) {
      return;
    }
    print("asdawsdx");
    final user = await _authService.signInWithGoogle();
    if (user != null) {
      saveHive(user.user!);
      print("User: ${user.user!.displayName}");
      update();
    }
  }

  saveHive(User user) {
    var data = {
      "name": user.displayName,
      "email": user.email,
      "image": user.photoURL,
      "uid": user.uid,
      "phone": user.phoneNumber,
      "emailVerified": user.emailVerified,
      "u_t": DateTime.now().millisecondsSinceEpoch,
      "posts": [],
    };
    userBox.putAll(data);
    userFire.create(user.uid, data);
  }
}
