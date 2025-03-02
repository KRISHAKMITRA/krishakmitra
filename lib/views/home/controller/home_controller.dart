import 'package:get/get.dart';
import 'package:krishak/funs/auth/auth.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    print("objec>>>>>>>>>>><<<<t");
    // googleSignIn();
    super.onInit();
  }

  final AuthService _authService = AuthService();

  googleSignIn() async {
    print("asdawsdx");
    final user = await _authService.signInWithGoogle();
    if (user != null) {
      print("User: ${user.user!.displayName}");
    }
  }
}
